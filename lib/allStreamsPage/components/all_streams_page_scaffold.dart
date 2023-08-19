import 'package:streamme/core/core_info.dart';
import 'package:streamme/core/helpers/navigation_helper.dart';
import 'package:streamme/size_config.dart';
import 'package:streamme/widgets/bloc_temp_widget.dart';
import 'package:streamme/widgets/general_app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/main_layout_widget.dart';
import '../controller.dart';
import '../state.dart';
import 'all_streams_component.dart';

class AllStreamsPageScaffold extends StatelessWidget {
  const AllStreamsPageScaffold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AllStreamsPageController blocController = AllStreamsPageController.of(context);
    return MainLayoutWidget(
      minHeight: SizeConfig.screenHeight - 200,
      appBar: generalAppBar(title: "Streams", haveBackButton: false),
      scrollController: blocController.streamRepo.paginationHandler.scrollController,
      onRefresh: () async {
        blocController.streams.clear();
        blocController.streamRepo.paginationHandler.resetHandler();
        await blocController.getAllStreams();
      },
      floatingButton: FloatingActionButton(
        onPressed: blocController.createStream,
        child: const Icon(Icons.add),
      ),
      widget: BlocBuilder(
        bloc: blocController,
        builder: (context, state) {
          return BlocTempWidget(
            successWidget: const AllStreamsComponent(),
            errorState: state is AllStreamsPageError,
            loadingState: state is AllStreamsPageLoading,
          );
        },
      ),
    );
  }
}
