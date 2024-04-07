import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomDatePicker extends StatelessWidget {
  final TextEditingController controller;
  const CustomDatePicker({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1950),
            //DateTime.now() - not to allow to choose before today.
            lastDate: DateTime(2100));
        controller.text = pickedDate.toString();
        debugPrint("Picked Date: $pickedDate");
        if (pickedDate != null) {
          String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
          debugPrint("Formatted Date: $formattedDate");
        } else {}
      },
      child: TextField(
        controller: controller,
        enabled: false,
        decoration: InputDecoration(
          labelText: 'Date of Birth',
          hintText: 'Choose your date of birth',
        ),
      ),
    );
  }
}
