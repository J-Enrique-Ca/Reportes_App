import 'package:flutter/material.dart';


class CustomButton extends StatelessWidget {
  final String texto;
  final VoidCallback? onPressed;
  final Color colorFondo;
  final Color colorTexto;

  const CustomButton({
    super.key,
    required this.texto,
    this.onPressed,
    this.colorFondo = const Color(0xFF3333FF),
    this.colorTexto = const Color(0xFFFFFFFF),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: colorFondo,
          foregroundColor: colorTexto, 
          elevation: 6, 
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          
        ),
        child: Text(
          texto,
          style: TextStyle(
            color: colorTexto,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}