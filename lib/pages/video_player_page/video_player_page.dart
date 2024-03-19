import 'package:flutter/material.dart';
import 'package:loop_page_view/loop_page_view.dart';
import 'package:tiktok_ui/constant/dart_json.dart';
import 'package:tiktok_ui/pages/video_player_page/video_player_item.dart';

class VideoPlayerPage extends StatefulWidget {
  const VideoPlayerPage({super.key});

  @override
  State<VideoPlayerPage> createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  final LoopPageController controller = LoopPageController(
    scrollMode: LoopScrollMode.forwards,
    activationMode: LoopActivationMode.forwardOnly,
  );

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final size = MediaQuery.sizeOf(context);
    return SafeArea(
      top: false,
      child: LoopPageView.builder(
          controller: controller,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return VideoPlayerItem(
              videoUrl: items[index]['videoUrl'] as String,
              size: size,
              name: items[index]['name'] as String,
              caption: items[index]['caption'] as String,
              songName: items[index]['songName'] as String,
              profileImg: items[index]['profileImg'] as String,
              likes: items[index]['likes'] as String,
              comments: items[index]['comments'] as String,
              shares: items[index]['shares'] as String,
              albumImg: items[index]['albumImg'] as String,
            );
          },
          itemCount: items.length),
    );
  }
}
