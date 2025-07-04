import 'package:flutter/material.dart';
import 'package:my_gorge_job/widgets/colors.dart';

class Containersplash extends StatelessWidget {
  const Containersplash({super.key, required this.color, required this.label});
  final Color color;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: primaryColor, width: 2),
          color: color,
        ),
        height: 50,
        width: 400,

        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: color == primaryColor ? Colors.white : primaryColor,
              fontSize: MediaQuery.of(context).size.width * 0.05,
              letterSpacing: 1.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
