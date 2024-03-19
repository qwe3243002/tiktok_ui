import 'package:flutter/material.dart';

class UploadIcon extends StatelessWidget {
  const UploadIcon({super.key});
  static const primary = Color(0xFFFC2D55);
  static const secondary = Color(0xFF19D5F1);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 35,
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 0,
            child: Container(
              width: 40,
              height: 35,
              decoration: BoxDecoration(color: secondary, borderRadius: BorderRadius.circular(8)),
            ),
          ),
          Positioned(
            right: 0,
            child: Container(
              width: 40,
              height: 35,
              decoration: BoxDecoration(color: primary, borderRadius: BorderRadius.circular(8)),
            ),
          ),
          Positioned(
            right: 5,
            child: Container(
              width: 40,
              height: 35,
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
              child: const Icon(Icons.add),
            ),
          )
        ],
      ),
    );
  }
}
