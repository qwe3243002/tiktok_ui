import 'package:flutter/material.dart';
import 'package:tiktok_ui/common_widgets/my_footer.dart';
import 'package:tiktok_ui/constant/footer_config.dart';
import 'package:tiktok_ui/extension/list_extension.dart';
import 'package:tiktok_ui/pages/video_player_page/video_player_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: bottomItems.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      extendBody: true,
      body: SafeArea(
        bottom: false,
        top: false,
        child: TabBarView(
          controller: _tabController,
          children: bottomItems.mapWithIndex<Widget>((index, item) {
            if (index == 0) {
              return const VideoPlayerPage();
            }
            return Center(
              child: Text(
                item["label"] as String,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            );
          }).toList(),
        ),
      ),
      bottomNavigationBar: MyFooter(
        onChanged: (pageIndex) {
          print("$pageIndex");
          _tabController.animateTo(pageIndex);
        },
      ),
    );
  }
}
