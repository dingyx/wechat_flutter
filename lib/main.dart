import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wechat/page/find_page.dart';
import 'package:wechat/page/recent_chat_page.dart';
import 'package:wechat/widget/color.dart';

void main() {
  //  Android 设置透明状态栏
  if (Platform.isAndroid) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
  } else if (Platform.isIOS) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wechat',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // 底部 tab icon
  var iconList = const [
    "assets/images/wechat.png",
    "assets/images/contacts.png",
    "assets/images/find.png",
    "assets/images/mine.png"
  ];

  // 底部 tab 标题
  var labelList = const ["微信", "通讯录", "发现", "我的"];

  // 当前选中位置
  int _selectedIndex = 0;

  // BottomNavigationBar 点击事件
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // 根据选中状态设置底部图标颜色
  Color _iconColor(int index) {
    return _selectedIndex == index ? Color(0xFF0DD068) : Color(0xFF515151);
  }

  // 获取底部 BottomNavigationBarItem
  _getBarItems() {
    var items = <BottomNavigationBarItem>[];
    for (int i = 0; i < 4; i++) {
      items.add(
        BottomNavigationBarItem(
          icon: Image(
            width: 24,
            height: 24,
            color: _iconColor(i),
            image: AssetImage(iconList.elementAt(i)),
          ),
          label: labelList.elementAt(i),
        ),
      );
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // 背景色
        backgroundColor: themeColor,
        // 标题居中
        centerTitle: true,
        // 取消默认阴影
        elevation: 0,
        // title 内容
        title: Text(
          labelList.elementAt(_selectedIndex),
          style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.w500),
          textAlign: TextAlign.center,
        ),
        // 右侧按钮
        actions: [
          Image(
            width: 24,
            height: 24,
            image: AssetImage("assets/images/search.png"),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 12.0),
            child: Image(
              width: 24,
              height: 24,
              image: AssetImage("assets/images/add.png"),
            ),
          ),
        ],
      ),
      body: Container(
        child: _centerPage(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        // 背景色
        backgroundColor: Color(0xFFF7F7F7),
        // 取消阴影
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        // 选中未选中文字大小 不设置的话默认选中文字会放大
        selectedFontSize: 12.0,
        unselectedFontSize: 12.0,
        // 文字颜色
        unselectedItemColor: Color(0xFF515151),
        selectedItemColor: Color(0xFF0DD068),
        // 选中某一项
        currentIndex: _selectedIndex,
        // 选中回调方法
        onTap: _onItemTapped,
        // BottomNavigationBarItems
        items: _getBarItems(),
      ),
    );
  }

  _centerPage() {
    switch (_selectedIndex) {
      case 0:
        return RecentChatPage();
      case 1:
        return Text(
          "通讯录",
          style: TextStyle(fontSize: 18),
        );
      case 2:
        return FindPage();
      case 3:
        return Text(
          "我的",
          style: TextStyle(fontSize: 18),
        );
      default:
        return Text(
          "TODO",
          style: TextStyle(fontSize: 18),
        );
    }
  }
}
