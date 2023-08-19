import 'package:streamme/allStreamsPage/models/stream_model.dart';

class AgoraModel{
  StreamModel streamModel;
  String token;

  AgoraModel({required this.streamModel, required this.token});

  factory AgoraModel.fromJson(Map<String, dynamic> json) {
    return AgoraModel(
      streamModel: StreamModel.fromJson(json["stream"]),
      token: json["token"],
    );
  }
}