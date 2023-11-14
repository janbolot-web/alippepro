import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String labelText;
  final String type;

  const CustomTextField(
      {Key? key,
      required this.controller,
      required this.hintText,
      required this.labelText,
      required this.type})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: type == 'password' ?? true,
      controller: controller,
      style: TextStyle(color: Color(0xff054e45)),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xff054e45), width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xff054e45), width: 1),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        filled: true,
        fillColor: const Color(0xffF5F6FA),
        hintText: hintText,
        labelText: labelText,
        labelStyle: TextStyle(color: Color(0xff054e45).withOpacity(0.5), fontSize: 14),
        hintStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
