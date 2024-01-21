import 'package:flutter/material.dart';

enum TypeComparison { TABLE, CHART }

class SingleChoice extends StatefulWidget {
  final void Function(String) onChanged;

  const SingleChoice({Key? key, required this.onChanged}) : super(key: key);

  @override
  State<SingleChoice> createState() => _SingleChoiceState();
}

class _SingleChoiceState extends State<SingleChoice> {
  TypeComparison typeView = TypeComparison.TABLE;

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<TypeComparison>(
      segments: const <ButtonSegment<TypeComparison>>[
        ButtonSegment<TypeComparison>(
          value: TypeComparison.TABLE,
          label: Text('Tabla'),
          icon: Icon(Icons.table_chart),
        ),
        ButtonSegment<TypeComparison>(
          value: TypeComparison.CHART,
          label: Text('Grafico'),
          icon: Icon(Icons.bar_chart),
        ),
      ],
      selected: <TypeComparison>{typeView},
      onSelectionChanged: (Set<TypeComparison> newSelection) {
        setState(() {
          typeView = newSelection.first;
          widget.onChanged(typeView.toString().split('.').last);
        });
      },
    );
  }
}
