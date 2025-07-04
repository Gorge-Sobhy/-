import 'package:flutter/material.dart';

class TextSpalshScreen extends StatelessWidget {
  const TextSpalshScreen({super.key, required this.primaryColor});
  final Color primaryColor ;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text(
        "خدمة البابا ديسقورس",
        style: TextStyle(
          fontSize: MediaQuery.of(context).size.width * 0.094,
          color: primaryColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
