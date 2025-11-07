import 'package:flutter/material.dart';


class CustomInput extends StatelessWidget {
  final String label;
  final String placeholder;
  final TextEditingController controller;
  final bool isPassword;
  final TextInputType keyboardType;

  const CustomInput({
    super.key,
    required this.label,
    required this.controller,
    this.placeholder = "",
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 4, bottom: 4),
            child: Text(
              label,
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff333333)),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: const Color(0xFFF0F0F0),
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    offset: const Offset(0, 2),
                    blurRadius: 4,
                  )
                ]),
            child: TextField(
              controller: controller,
              keyboardType: keyboardType,
              obscureText: isPassword,
              style: const TextStyle(fontSize: 16, color: Color(0xff000000)),
              cursorColor: const Color(0xff3333FF),
              decoration: InputDecoration(
                hintText: placeholder,
                hintStyle: const TextStyle(color: Color(0xFFAAAAAA)),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                border: InputBorder.none, 
              ),
            ),
          )
        ],
      ),
    );
  }
}
