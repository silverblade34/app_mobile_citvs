import 'package:flutter/material.dart';

class YearInput extends StatefulWidget {
  final String labelText;
  final ValueChanged<String>? onChanged;

  const YearInput({
    Key? key,
    required this.labelText,
    this.onChanged,
  }) : super(key: key);

  @override
  _YearInputState createState() => _YearInputState();
}

class _YearInputState extends State<YearInput> {
  late TextEditingController _selectedYear;

  @override
  void initState() {
    super.initState();
    _selectedYear = TextEditingController(
        text: DateTime.now().year.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextFormField(
        readOnly: true,
        controller: _selectedYear,
        decoration: InputDecoration(
          labelText: widget.labelText,
          suffixIcon: const Icon(Icons.calendar_today),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        onTap: () async {
          final int? pickedYear = await showYearPicker(
            context,
            int.parse(_selectedYear.text),
          );

          if (pickedYear != null) {
            _selectedYear.text = pickedYear.toString();
            if (widget.onChanged != null) {
              widget.onChanged!(_selectedYear.text);
            }
          }
        },
      ),
    );
  }
}

Future<int?> showYearPicker(BuildContext context, int currentYear) async {
  final DateTime? picked = await showDatePicker(
    context: context,
    initialDate: DateTime(currentYear),
    firstDate: DateTime(currentYear - 10),
    lastDate: DateTime(currentYear + 10),
    initialDatePickerMode: DatePickerMode.year,
  );

  if (picked != null) {
    return picked.year;
  }

  return null;
}
