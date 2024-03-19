import 'package:flutter/material.dart';
import 'package:tiktok_ui/common_widgets/left_panel.dart';
import 'package:tiktok_ui/common_widgets/right_panel.dart';
import 'package:tiktok_ui/pages/video_player_page/video_player_item_header.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerItem extends StatefulWidget {
  final String videoUrl;
  final String name;
  final String caption;
  final String songName;
  final String profileImg;
  final String likes;
  final String comments;
  final String shares;
  final String albumImg;
  final Size size;

  const VideoPlayerItem({
    super.key,
    required this.videoUrl,
    required this.name,
    required this.caption,
    required this.songName,
    required this.profileImg,
    required this.likes,
    required this.comments,
    required this.shares,
    required this.albumImg,
    required this.size,
  });

  @override
  State<VideoPlayerItem> createState() => _VideoPlayerItemState();
}

class _VideoPlayerItemState extends State<VideoPlayerItem> {
  late VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.asset(widget.videoUrl)
      ..initialize().then((value) {
        _videoPlayerController.play();
        setState(() {});
      });
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  _updatePlayerState() {
    setState(() {
      _videoPlayerController.value.isPlaying ? _videoPlayerController.pause() : _videoPlayerController.play();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _updatePlayerState,
      child: Container(
        height: widget.size.height,
        width: widget.size.width,
        // padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Stack(
          children: [
            Container(
              height: widget.size.height,
              width: widget.size.width,
              decoration: const BoxDecoration(color: Colors.black),
              child: Stack(
                children: [
                  VideoPlayer(_videoPlayerController),
                  Center(
                    child: Container(
                      child: _videoPlayerController.value.isPlaying
                          ? Container()
                          : Icon(
                              Icons.play_arrow,
                              size: 80,
                              color: Colors.white.withOpacity(0.5),
                            ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: widget.size.height,
              width: widget.size.width,
              child: Padding(
                padding: const EdgeInsets.only(left: 15, top: 20, bottom: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(height: MediaQuery.of(context).padding.top),
                    const VideoPlayerItemHeader(),
                    Expanded(
                      child: Row(
                        children: [
                          LeftPanel(
                            size: widget.size,
                            name: widget.name,
                            caption: widget.caption,
                            songName: widget.songName,
                          ),
                          RightPanel(
                            size: widget.size,
                            profileImg: widget.profileImg,
                            likes: widget.likes,
                            comments: widget.comments,
                            shares: widget.shares,
                            albumImg: widget.albumImg,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
