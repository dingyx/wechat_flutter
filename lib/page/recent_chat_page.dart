import 'package:flutter/material.dart';
import 'package:wechat/data/chat_recent_model.dart';
import 'package:wechat/util/mock_data.dart';

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
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      // physics: NeverScrollableScrollPhysics(),
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
            //     Spacer(),
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
      separatorBuilder: (context, index) {
        return Divider(
          indent: 68,
          height: 12,
          thickness: 0.3,
        );
      },
      itemCount: chatModelList.length,
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
