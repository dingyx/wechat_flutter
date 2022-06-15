import 'package:flutter/material.dart';
import 'package:wechat/widget/color.dart';
import 'package:wechat/widget/find_type_widget.dart';

/// 发现页
class FindPage extends StatelessWidget {
  const FindPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: themeColor,
        child: Column(
          children: [
            // 朋友圈
            FindTypeWidget("assets/images/friend_circle.png", "朋友圈"),
            SizedBox(height: 12),
            // 扫一扫
            FindTypeWidget("assets/images/scan.png", "扫一扫"),
            SizedBox(height: 12),
            // 小程序
            FindTypeWidget("assets/images/mini_program.png", "小程序"),
          ],
        ));
  }
}
