import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:streamme/allStreamsPage/models/agora_model.dart';
import 'components/stream_page_scaffold.dart';
import 'controller.dart';

class StreamPageView extends StatelessWidget {
  final AgoraModel agoraModel;
  const StreamPageView({Key? key, required this.agoraModel,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StreamPageController(agoraModel),
      child: const StreamPageScaffold(),
    );
  }
}
