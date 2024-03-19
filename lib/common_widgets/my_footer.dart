import 'package:flutter/material.dart';
import 'package:tiktok_ui/common_widgets/upload_icon.dart';
import 'package:tiktok_ui/constant/footer_config.dart';
import 'package:tiktok_ui/extension/list_extension.dart';

class MyFooter extends StatelessWidget {
  final ValueChanged<int> onChanged;

  const MyFooter({
    super.key,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      decoration: const BoxDecoration(color: Colors.black),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: bottomItems.mapWithIndex<Widget>((index, item) {
              return GestureDetector(
                onTap: () => onChanged(index),
                child: item["isIcon"] as bool
                    ? Column(
                        children: <Widget>[
                          Icon(
                            item["icon"] as IconData?,
                            color: Colors.white,
                          ),
                          const SizedBox(height: 5),
                          Text(
                            item["label"] as String,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                            ),
                          )
                        ],
                      )
                    : const UploadIcon(),
              );
            }).toList()),
      ),
    );
  }
}
