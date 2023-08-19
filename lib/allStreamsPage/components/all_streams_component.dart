import 'package:streamme/allStreamsPage/widgets/stream_widget.dart';
import 'package:streamme/widgets/pagination_loading_wrap_widget.dart';
import 'package:flutter/material.dart';

import '../controller.dart';

class AllStreamsComponent extends StatefulWidget {
  const AllStreamsComponent({super.key});

  @override
  State<AllStreamsComponent> createState() => _AllStreamsComponentState();
}

class _AllStreamsComponentState extends State<AllStreamsComponent> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    AllStreamsPageController.of(context)
        .streamRepo
        .paginationHandler
        .addListenerToController();
  }

  @override
  Widget build(BuildContext context) {
    AllStreamsPageController blocController = AllStreamsPageController.of(context);
    return PaginationLoadingWrapWidget(
        paginationHandler: blocController.streamRepo.paginationHandler,
        child: Column(
          children: [
            ...blocController.streams.map(
              (e) => StreamWidget(streamModel: e),
            ),
          ],
        ),);
  }
}
