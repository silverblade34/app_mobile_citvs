import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
class DatePicker extends StatefulWidget {
  const DatePicker({
    Key? key,
    required this.label,
    required this.onChanged,
    required this.initialDate, // Cambio para recibir la fecha como String
  }) : super(key: key);

  final String label;
  final ValueChanged<String>? onChanged;
  final String initialDate; // Cambio: recibir la fecha como String

  @override
  State<DatePicker> createState() => DatePickerState();
}

class DatePickerState extends State<DatePicker> {
  late TextEditingController _date;

  @override
  void initState() {
    super.initState();
    _date = TextEditingController(text: widget.initialDate);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextField(
        controller: _date,
        decoration: InputDecoration(
          icon: const Icon(
            Icons.calendar_today_rounded,
            color: Color.fromARGB(255, 85, 123, 161),
          ),
          labelText: widget.label,
        ),
        onTap: () async {
          DateTime? initialDate = DateTime.tryParse(widget.initialDate);

          DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: initialDate ?? DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2101),
            locale: const Locale('es', 'ES'),
          );

          if (pickedDate != null) {
            setState(() {
              _date.text = DateFormat('yyyy-MM-dd').format(pickedDate);
              if (widget.onChanged != null) {
                widget.onChanged!(_date.text);
              }
            });
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _date.dispose();
    super.dispose();
  }
}
