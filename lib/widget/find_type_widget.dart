import 'package:flutter/material.dart';

// 自定义发现 widget
FindTypeWidget(String assetImage, String findType) {
  return Container(
    padding: EdgeInsets.all(16),
    color: Colors.white,
    child: Row(
      children: [
        // 左侧图片
        Image(
          width: 24,
          height: 22,
          image: AssetImage(assetImage),
        ),
        // 中间文字内容
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(
              findType,
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
        // 右侧 更多按钮
        Image(
          width: 22,
          height: 22,
          image: AssetImage("assets/images/more.png"),
        ),
      ],
    ),
  );
}
