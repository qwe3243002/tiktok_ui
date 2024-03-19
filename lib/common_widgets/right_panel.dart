import 'package:flutter/material.dart';
import 'package:tiktok_ui/common_widgets/album.dart';
import 'package:tiktok_ui/common_widgets/my_icon.dart';
import 'package:tiktok_ui/common_widgets/profile.dart';
import 'package:tiktok_ui/constant/tiktok_icon.dart';

class RightPanel extends StatelessWidget {
  final Size size;
  final String likes;
  final String comments;
  final String shares;
  final String profileImg;
  final String albumImg;

  const RightPanel({
    super.key,
    required this.size,
    required this.likes,
    required this.comments,
    required this.shares,
    required this.profileImg,
    required this.albumImg,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: size.height,
        child: Column(
          children: [
            SizedBox(height: size.height * 0.3),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Profile(imgUrl: profileImg),
                MyIcon(iconData: MyTikTokIcons.heart, size: 35, hint: likes),
                MyIcon(iconData: MyTikTokIcons.chatBubble, size: 35, hint: comments),
                MyIcon(iconData: MyTikTokIcons.reply, size: 25, hint: shares),
                Album(imgUrl: albumImg),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
