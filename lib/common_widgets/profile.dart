import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  final String imgUrl;

  const Profile({super.key, required this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 60,
      child: Stack(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              shape: BoxShape.circle,
              image: DecorationImage(
                image: CachedNetworkImageProvider(imgUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 3,
            left: 18,
            child: Container(
              width: 20,
              height: 20,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red,
              ),
              child: const Center(
                  child: Icon(
                Icons.add,
                color: Colors.white,
                size: 15,
              )),
            ),
          )
        ],
      ),
    );
  }
}
