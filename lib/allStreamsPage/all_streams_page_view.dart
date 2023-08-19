import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'components/all_streams_page_scaffold.dart';
import 'controller.dart';

class AllStreamsPageView extends StatelessWidget {
  const AllStreamsPageView({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AllStreamsPageController()..getAllStreams(),
      child: const AllStreamsPageScaffold(),
    );
  }
}
