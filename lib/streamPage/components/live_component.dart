import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:streamme/streamPage/controller.dart';


class LiveComponent extends StatelessWidget {
  const LiveComponent({super.key});

  @override
  Widget build(BuildContext context) {
    StreamPageController blocController = StreamPageController.of(context);
    print(blocController.agoraHelper.remoteUid);
    return Expanded(
      child: BlocBuilder(
        bloc: blocController,
        builder: (context, state){
          if(blocController.agoraHelper.engine == null) return const Center(child: CircularProgressIndicator(),);
          if(blocController.agoraModel.streamModel.isMe){
            return AgoraVideoView(
              controller:  VideoViewController(
                rtcEngine: blocController.agoraHelper.engine!,
                canvas: const VideoCanvas(uid: 0),
              ),
            );
          }
          if(blocController.agoraHelper.remoteUid == null) return const Center(child: CircularProgressIndicator(),);
          // return SizedBox();
          return AgoraVideoView(
            controller: VideoViewController.remote(
              rtcEngine: blocController.agoraHelper.engine!,
              canvas: VideoCanvas(uid: blocController.agoraHelper.remoteUid),
              connection: RtcConnection(channelId:blocController.agoraModel.streamModel.channelName,),
            ),
          );
        },
      ),
    );
  }
}
