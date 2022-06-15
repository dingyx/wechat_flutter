import 'package:wechat/data/chat_recent_model.dart';

/// mock 最近聊天记录数据
mockChatRecent() {
  List<ChatRecentModel> list = [];
  ChatRecentModel chatRecentModel1 = new ChatRecentModel(
    avatarUrl: "assets/images/group.webp",
    name: "xx分公司",
    date: "下午2:56",
    message: "通知一下，明天不放假。",
  );
  ChatRecentModel chatRecentModel2 = new ChatRecentModel(
    avatarUrl: "assets/images/ori.webp",
    name: "Ori",
    message: "树精灵Ori在林中探索，使枯萎的树林回复生机。",
    date: "下午1:10",
    noDisturb: true,
  );
  ChatRecentModel chatRecentModel3 = new ChatRecentModel(
    avatarUrl: "assets/images/ori_jump.jpeg",
    name: "Gumo",
    date: "上午10:30",
    message: "承载着Ori自由飞翔，自在快乐极了",
    noDisturb: true,
  );

  ChatRecentModel chatRecentModel4 = new ChatRecentModel(
    avatarUrl: "assets/images/wechat_avatar.png",
    name: "微信运动",
    date: "昨天",
    message: "[应用消息]",
  );

  ChatRecentModel chatRecentModel5 = new ChatRecentModel(
    avatarUrl: "assets/images/guanggu.jpeg",
    name: "光谷政务",
    date: "昨天",
    message: "三月份的光谷政务",
    noDisturb: true,
  );
  ChatRecentModel chatRecentModel6 = new ChatRecentModel(
    avatarUrl: "assets/images/sea.jpg",
    name: "xx员工群",
    date: "3月28日",
    message: "通知：明天开始放假三天。",
  );
  ChatRecentModel chatRecentModel7 = new ChatRecentModel(
      avatarUrl: "assets/images/shunfeng.jpeg",
      name: "顺丰速运",
      date: "3月6日",
      message: "买买买之后，为您准备的快递操作秘籍。",
      noDisturb: true);

  ChatRecentModel chatRecentModel8 = new ChatRecentModel(
    avatarUrl: "assets/images/android.jpeg",
    name: "HenCoder",
    date: "3月1日",
    message: "三月好学季!!!",
    noDisturb: true,
  );

  ChatRecentModel chatRecentModel9 = new ChatRecentModel(
    avatarUrl: "assets/images/wechat_avatar.png",
    name: "微信支付",
    date: "2月20日",
    message: "收款通知-来自商家转账",
    noDisturb: true,
  );

  ChatRecentModel chatRecentModel10 = new ChatRecentModel(
    avatarUrl: "assets/images/wechat_avatar.png",
    name: "订阅号消息",
    date: "2月8日",
    message: "火星影剧：Netflix 怪奇物语 第四季 即将上线",
    noDisturb: true,
  );

  ChatRecentModel chatRecentModel11 = new ChatRecentModel(
      avatarUrl: "assets/images/ori.jpeg",
      name: "Ku",
      date: "1月16日",
      message: "Ku一边的羽翼没有羽毛，所以飞不起来就很不开心，这时Ori跟伙伴们也开始想办法帮助小猫头鹰。",
      noDisturb: true);

  list.add(chatRecentModel1);
  list.add(chatRecentModel2);
  list.add(chatRecentModel3);
  list.add(chatRecentModel4);
  list.add(chatRecentModel5);
  list.add(chatRecentModel6);
  list.add(chatRecentModel7);
  list.add(chatRecentModel8);
  list.add(chatRecentModel9);
  list.add(chatRecentModel10);
  list.add(chatRecentModel11);

  return list;
}
