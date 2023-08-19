import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:streamme/allStreamsPage/models/agora_model.dart';
import 'package:streamme/constants.dart';
import 'package:streamme/main.dart';
import 'package:streamme/streamPage/helper/agora_helper.dart';
import 'package:streamme/widgets/error_alert_dialogue_widget.dart';
import 'package:streamme/widgets/show_loading.dart';

import 'repo/stream_repo.dart';
import 'state.dart';

class StreamPageController extends Cubit<StreamPageState> {
  StreamPageController(this.agoraModel) : super(StreamPageInit()) {
    agoraHelper = AgoraHelper(agoraModel, this)..initAgora();
  }

  static StreamPageController of(context) => BlocProvider.of(context);
  StreamRepo streamRepo = StreamRepo();
  final AgoraModel agoraModel;

  updateAgoraValues() => emit(StreamPageInit());
  late AgoraHelper agoraHelper;

  void deleteStream() async {
    if(!agoraModel.streamModel.isMe) {
      Navigator.pop(navigatorKey.currentContext!);
      return;
    }
    showLoading();
    final result = await streamRepo.deleteStream(agoraModel);
    hideLoading();
    result.fold(
      (failure) => showErrorDialogue(failure.message ?? kErrorText),
      (data) {
        Navigator.pop(navigatorKey.currentContext!);
      },
    );
  }

  @override
  Future<void> close() async {
    await agoraHelper.dispose();
    return super.close();
  }
}
