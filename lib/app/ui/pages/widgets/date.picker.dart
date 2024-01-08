import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DatePicker extends StatefulWidget {
  const DatePicker({
    Key? key,
    required this.label,
  }) : super(key: key);
  final String label; // Asegúrate de que label sea de tipo String

  @override
  State<DatePicker> createState() => DatePickerState();
}

class DatePickerState extends State<DatePicker> {
  late TextEditingController _date;

  @override
  void initState() {
    super.initState();
    _date = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextField(
        controller: _date,
        decoration: InputDecoration(
          icon: const Icon(Icons.calendar_today_rounded),
          labelText: widget.label, // Utiliza widget.label para obtener el valor dinámico
        ),
        onTap: () async {
          DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2101),
          );

          if (pickedDate != null) {
            setState(() {
              _date.text = DateFormat('yyyy-MM-dd').format(pickedDate);
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


class DatePickerController extends GetxController {}
