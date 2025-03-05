/* Custom Widget - a picklist with List of String values
*/

import 'package:flutter/material.dart';

class PicklistCmp extends StatefulWidget {
  const PicklistCmp({
    super.key, 
    required this.picklistItems,
    required this.selectedValue,
    required this.onChanged,
  });
  final List<String> picklistItems;
  final String selectedValue;
  final Function(String value) onChanged;

  @override
  State<PicklistCmp>  createState() => _PicklistCmpState();
}

class _PicklistCmpState extends State<PicklistCmp> {
  late String selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.selectedValue; 
  }

  @override
  Widget build(BuildContext context) => Column(children: [
      DropdownButton<String>(
        value: widget.selectedValue,
        icon: const Icon(Icons.arrow_downward),
        elevation: 16,
        style: const TextStyle(color: Colors.deepPurple),
        underline: Container(
          height: 2,
          color: Colors.deepPurpleAccent,
        ),
        onChanged: (String? value) {
          setState(() {
            selectedValue = value!;
          });
          widget.onChanged(value!);
        },
        items:
            widget.picklistItems.map<DropdownMenuItem<String>>((String value) =>
              DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              ),
            ).toList(),
      ),
    ],
  );
}
