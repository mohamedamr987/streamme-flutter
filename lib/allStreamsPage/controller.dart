import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:streamme/allStreamsPage/repo/all_streams_repo.dart';
import 'package:streamme/constants.dart';
import 'package:streamme/core/helpers/navigation_helper.dart';
import 'package:streamme/main.dart';
import 'package:streamme/streamPage/stream_page_view.dart';
import 'package:streamme/widgets/error_alert_dialogue_widget.dart';
import 'package:streamme/widgets/show_loading.dart';

import 'models/stream_model.dart';
import 'state.dart';

class AllStreamsPageController extends Cubit<AllStreamsPageState> {
  AllStreamsPageController() : super(AllStreamsPageInit());

  static AllStreamsPageController of(context) => BlocProvider.of(context);
  AllStreamsRepo streamRepo = AllStreamsRepo();
  List<StreamModel> streams = [];

  Future<void> getAllStreams() async {
    emit(AllStreamsPageLoading());
    final result = await streamRepo.getAllStreams();
    result.fold(
      (failure) => emit(AllStreamsPageError()),
      (data) {
        streams.addAll(data);
        emit(AllStreamsPageDone());
      },
    );
  }

  Future<void> createStream() async {
    showLoading();
    final result = await streamRepo.createStream();
    hideLoading();
    result.fold(
      (failure) => showErrorDialogue(failure.message ?? kErrorText),
      (data) {
        NavigationHelper.push(navigatorKey.currentContext!, StreamPageView(agoraModel: data),);
      },
    );
  }

  Future<void> joinStream(StreamModel streamModel) async {
    showLoading();
    final result = await streamRepo.joinStream(streamModel);
    hideLoading();
    result.fold(
          (failure) => showErrorDialogue(failure.message ?? kErrorText),
          (data) {
        NavigationHelper.push(navigatorKey.currentContext!, StreamPageView(agoraModel: data),);
      },
    );
  }
}
