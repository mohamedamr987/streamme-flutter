import '../../core/core_info.dart';
import '../../core/models/user_model.dart';

class StreamModel{
  String id;
  String channelName;
  UserModel user;
  bool get isMe => user.id == CoreInfo.loggedUser!.id;

  StreamModel({
    required this.id,
    required this.channelName,
    required this.user,
  });

  factory StreamModel.fromJson(Map<String, dynamic> json){
    print(json["user"]);
    return StreamModel(
      id: json["_id"],
      channelName: json["channelName"],
      user: UserModel.fromJson(json["user"]),
    );
  }
}