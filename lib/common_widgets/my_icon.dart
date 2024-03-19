import 'package:flutter/material.dart';

class MyIcon extends StatelessWidget {
  final IconData iconData;
  final double size;
  final String hint;

  const MyIcon({
    super.key,
    required this.iconData,
    required this.size,
    required this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          iconData,
          color: Colors.white,
          size: size,
        ),
        const SizedBox(height: 5),
        Text(
          hint,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
