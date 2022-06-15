/// 最近聊天 model
class ChatRecentModel {
  // 头像 url
  String? avatarUrl;

  // 昵称
  String? name;

  // 最近一条记录日期
  String? date;

  // 最近一条消息
  String? message;

  // 是否已读
  bool isRead;

  // 是否免打扰
  bool noDisturb;

  ChatRecentModel({this.avatarUrl, this.name, this.date, this.message, this.isRead: true, this.noDisturb: false});
}
