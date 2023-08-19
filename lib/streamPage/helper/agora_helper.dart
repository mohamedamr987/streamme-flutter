import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:streamme/allStreamsPage/models/agora_model.dart';
import 'package:streamme/widgets/show_loading.dart';

import '../controller.dart';

class AgoraHelper{
  static const String appId = "603dc3996d1f46d7b838719b430bf97f";

  bool isSwitchingCamera = false;
  int? remoteUid;
  bool localUserJoined = false;
  RtcEngine? engine;
  bool isFreezed = false;
  bool isMuted = false;
  AgoraModel agoraModel;
  StreamPageController streamPageController;
  AgoraHelper(this.agoraModel, this.streamPageController);

  Future<void> initAgora() async {
    // retrieve permissions
    await [Permission.microphone, Permission.camera].request();

    //create the engine
    engine = createAgoraRtcEngine();
    await engine?.initialize(const RtcEngineContext(
      appId: appId,
    ));

    engine?.registerEventHandler(rtcEngineEventHandler());

    await engine?.setClientRole(role: ClientRoleType.clientRoleBroadcaster);
    await engine?.enableVideo();
    await engine?.enableAudio();
    if(agoraModel.streamModel.isMe){
      await engine?.startPreview();
    }
    streamPageController.updateAgoraValues();
    joinChannel();
  }

  Future<void> joinChannel() async {

    await engine?.joinChannel(
      token: agoraModel.token,
      channelId: agoraModel.streamModel.channelName,
      uid: 0,
      options: const ChannelMediaOptions(),
    );
  }
  RtcEngineEventHandler rtcEngineEventHandler () => RtcEngineEventHandler(
    onJoinChannelSuccess: (RtcConnection connection, int elapsed) {
      debugPrint("local user ${connection.localUid} joined");
      localUserJoined = true;
      streamPageController.updateAgoraValues();
    },
    onUserJoined: (RtcConnection connection, int receivedRemoteUid, int elapsed) {
      if(remoteUid == null){
        debugPrint("remote user $remoteUid joined");
        remoteUid = receivedRemoteUid;
        streamPageController.updateAgoraValues();
      }
    },
    onUserOffline: (RtcConnection connection, int receivedRemoteUid, UserOfflineReasonType reason) async {
      
    },
    onTokenPrivilegeWillExpire: (RtcConnection connection, String token) {
      // debugPrint('[onTokenPrivilegeWillExpire] connection: ${connection.toJson()}, token: $token');
    },
    onError: (ErrorCodeType code, String message) {
      debugPrint('[onError] code: $code');
    },
    onRemoteVideoStateChanged: (RtcConnection connection, int receivedRemoteUid , RemoteVideoState remoteVideoState, RemoteVideoStateReason remoteVideoStateReason,int elapsed) {
      debugPrint('[onRemoteVideoStateChanged] connection: ${connection.toJson()}, remoteUid: $receivedRemoteUid, remoteVideoState: $remoteVideoState, remoteVideoStateReason: $remoteVideoStateReason, elapsed: $elapsed');
      print(remoteVideoState == RemoteVideoState.remoteVideoStateFrozen);
      if(remoteVideoState == RemoteVideoState.remoteVideoStateFrozen){
        isFreezed = true;
      }
      else{
        isFreezed = false;
      }
      streamPageController.updateAgoraValues();
    },
  );

  void flipCamera() async {
    if(isSwitchingCamera) return;
    isSwitchingCamera = true;
    await engine?.switchCamera();
    isSwitchingCamera = false;
  }

  void mute() async {
    isMuted = !isMuted;
    await engine?.muteLocalAudioStream(isMuted);
  }

  Future<void> dispose() async {
    await engine?.leaveChannel();
    engine?.release();
  }
}