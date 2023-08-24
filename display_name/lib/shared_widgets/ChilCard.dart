import 'package:flutter/material.dart';

class ChildCard extends StatelessWidget {
  final List<String> ageList;
  final String selectedAge;
  final void Function(String) onAgeChanged;

  ChildCard({
    required this.ageList,
    required this.selectedAge,
    required this.onAgeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          DropdownButton<String>(
            value: selectedAge,
            onChanged: (String? newValue) {
              if (newValue != null) {
                onAgeChanged(newValue);
                print('selected ageee : ${selectedAge}');
              }
            },
            items: ageList.map<DropdownMenuItem<String>>((String age) {
              return DropdownMenuItem<String>(
                value: age,
                child: Text(age),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
