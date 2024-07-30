import 'package:flutter/material.dart';

class MyInputField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final FormFieldValidator? validator;
  final IconData? icon;
  const MyInputField(
      {super.key,
      required this.controller,
      required this.hintText,
      this.icon,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: TextFormField(
        controller: controller,
        validator: validator,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: Icon(icon, color: Colors.black),
            labelText: hintText,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.withOpacity(.5)),
              borderRadius: BorderRadius.circular(8),
            ),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black),
                borderRadius: BorderRadius.circular(8)),
            errorBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: Color.fromARGB(230, 215, 40, 40)),
                borderRadius: BorderRadius.circular(8))),
      ),
    );
  }
}
