import 'package:flutter/material.dart';

class CustomPhoneField extends StatelessWidget {
  const CustomPhoneField(
      {super.key, required this.controller, required this.hinttext});

  final TextEditingController controller;
  final String hinttext;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: TextFormField(
        keyboardType: TextInputType.number,
        controller: controller,
        decoration: InputDecoration(
          prefixText: '+91 ',
          filled: true,
          fillColor: const Color.fromRGBO(75, 58, 136, 1),
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(20)),
          hintText: hinttext,
          hintStyle: const TextStyle(),
        ),
      ),
    );
  }
}
