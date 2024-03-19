import 'package:flutter/material.dart';

class LeftPanel extends StatelessWidget {
  final String name;
  final String caption;
  final String songName;
  final Size size;

  const LeftPanel({
    super.key,
    required this.name,
    required this.caption,
    required this.songName,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width * 0.8,
      height: size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            caption,
            style: const TextStyle(color: Colors.white),
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              const Icon(
                Icons.music_note,
                color: Colors.white,
                size: 15,
              ),
              Flexible(
                child: Text(
                  songName,
                  style: const TextStyle(
                    color: Colors.white,
                    height: 1.5,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
