### Flutter 仿写微信效果图

<center class = "half">
<img src = "https://dingyx.oss-cn-shenzhen.aliyuncs.com/picgo/flutter_wechat_recent_chat.png"  width = "25%" ><img src = "https://dingyx.oss-cn-shenzhen.aliyuncs.com/picgo/flutter_wechat_find.png"  width = "25%" >
</center>

### 完整代码

github地址：[wechat_flutter](https://github.com/dingyx/wechat_flutter)

### 开始前准备

* New Flutter Project 

* 删除 main.dart 多余代码

* 在项目根目录创建 /assets/image 文件夹，放入需要使用的图片

* 修改 pubspec.yaml 以便加载图片文件

  ```yaml
  name: wechat
  description: A new Flutter project.
  
  ....
  
  flutter:
    uses-material-design: true
    # 加载目录文件
    assets:
      - assets/images/
  ```

  > 添加依赖等也在该文件配置

### 状态栏设置

在 Android 中需要对状态栏进行设置实现透明效果

修改 main.dart ，在 `runApp(const MyApp())` 前加上如下设置

```dart
void main() {
  //  Android 设置透明状态栏
  if (Platform.isAndroid) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
  }
  runApp(const MyApp());
}
```

如果不进行设置在 Android 中状态栏会有阴影存在

### 页面结构

main.dart

```dart
  @override
  Widget build(BuildContext context) {
    return Scaffold(),
      appBar: AppBar(),
      body: Container(),
      bottomNavigationBar: BottomNavigationBar(),
    );
  }
```

* appBar

  显示顶部标题、操作按钮等

* body

  主体内容

* bottomNavigator

  导航栏 切换不同 body

### 数据准备

* 顶部 icon 放在 assets/images  目录图片

  ```dart
  // 底部 tab icon
  var iconList = const [
  	"assets/images/wechat.png",
  	"assets/images/contacts.png",
  	"assets/images/find.png",
  	"assets/images/mine.png"
  ];
  ```

  底部四个图标，放在 assets/images 文件夹

* 底部 tab 标题

  ```dart
  var labelList = const ["微信", "通讯录", "发现", "我"];
  ```

  仿微信底部四个 tab 名字

* 当前 tab 选中位置

  ```dart
  int _selectedIndex = 0;
  ```

  默认选中第一项


  根据选中状态设置底部图标颜色

* BottomNavigationBar 顶部点击回调

  ```dart
  void _onItemTapped(int index) {
      setState(() {
          _selectedIndex = index;
      });
  }
  ```

  点击底部 tab 切换时触发

* 底部图标颜色

  ```dart
  // 参数 index 为当前图标位置
  // _selectedIndex 为选中时颜色
  Color _iconColor(int index) {
      return _selectedIndex == index ? Color(0xFF0DD068) : Color(0xFF515151);
  }
  ```

  根据选中状态动态设置底部图标颜色

### appBar

```dart
AppBar(
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
        // 右侧按钮 搜索、添加
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
      )
```

采用系统 AppBar 实现顶部效果

### bottomNavigationBar

底部导航栏

```dart
BottomNavigationBar(
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
```

* `_getBarItems()` 获取底部四个 item 

  "微信"、 "通讯录"、 "发现"、"我"

  ```dart
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
  ```

### body

中间主体内容部分

```dart
Container(
    child: _centerPage(),
)
```

* `_currentPage()` 根据底部 item 切换动态设置中间内容

  ```dart
    _centerPage() {
      switch (_selectedIndex) {
        case 0:
          return RecentChatPage();
        case 1:
          return Text("通讯录");
        case 2:
          return FindPage();
        case 3:
          return Text("我"),
          );
        default:
          return Text(
            "TODO",
            style: TextStyle(fontSize: 18),
          );
      }
    }
  }
  ```

  当前实现了 "微信"、"发现" 页面

### 聊天列表

```dart
class RecentChatPage extends StatefulWidget {
  const RecentChatPage({Key? key}) : super(key: key);
  @override
  _RecentChatPageState createState() => _RecentChatPageState();
}

class _RecentChatPageState extends State<RecentChatPage> {
  // 最近聊天数据
  List<ChatRecentModel> chatModelList = [];

  @override
  void initState() {
    super.initState();
      // 初始化数据
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, i) {
        return Row(
          children: [
            // 左侧 头像
            Padding(
              padding: const EdgeInsets.only(left: 12.0, right: 8, top: 8, bottom: 8),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image(
                  width: 48,
                  height: 48,
                  fit: BoxFit.cover,
                  image: AssetImage(chatModelList.elementAt(i).avatarUrl ?? ""),
                ),
              ),
            ),
            // 中间 昵称、最近一条聊天记录
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    chatModelList.elementAt(i).name ?? "",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 6),
                  Text(
                    chatModelList.elementAt(i).message ?? "",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 13, color: Color(0xFFBABABA)),
                  ),
                ],
              ),
            ),
            // 右侧 时间、是否免打扰
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: Text(
                    chatModelList.elementAt(i).date ?? "",
                    style: TextStyle(fontSize: 13, color: Color(0xFFBABABA)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 6.0, right: 12),
                  child: SizedBox(
                    width: 15,
                    height: 15,
                    child: Opacity(
                      opacity: chatModelList.elementAt(i).noDisturb ? 1.0 : 0.0,
                      child: Image(
                        image: AssetImage("assets/images/mute.png"),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
      // 分隔线
      separatorBuilder: (context, index) {
        return Divider(
          indent: 68,
          height: 12,
          thickness: 0.3,
        );
      },
      itemCount: chatModelList.length,
       // iOS 回弹效果
      physics: BouncingScrollPhysics(),
    );
  }

  // 加载最近聊天数据
  void _loadData() {
    var chatData = mockChatRecent();
    setState(() {
      chatModelList = chatData;
    });
  }
}
```

###  发现页

```dart
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

```

* 自定义组合控件 `FindTypeWidget` 

  ```dart
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
  ```

  

