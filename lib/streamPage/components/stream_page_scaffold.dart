import 'package:streamme/size_config.dart';
import 'package:streamme/widgets/bloc_temp_widget.dart';
import 'package:streamme/widgets/general_app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/main_layout_widget.dart';
import '../controller.dart';
import '../state.dart';
import 'live_component.dart';

class StreamPageScaffold extends StatelessWidget {
  const StreamPageScaffold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    StreamPageController blocController = StreamPageController.of(context);
    return WillPopScope(
      onWillPop: () async {
        blocController.deleteStream();
        return false;
      },
      child: MainLayoutWidget(
        isScrollable: false,
        appBar: generalAppBar(title: "Streams",),
        widget: BlocBuilder(
          bloc: blocController,
          builder: (context, state) {
            return BlocTempWidget(
              successWidget: const LiveComponent(),
              errorState: state is StreamPageError,
              loadingState: state is StreamPageLoading,
            );
          },
        ),
      ),
    );
  }
}
