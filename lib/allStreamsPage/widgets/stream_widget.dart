import 'package:flutter/material.dart';
import 'package:streamme/allStreamsPage/controller.dart';
import 'package:streamme/allStreamsPage/models/stream_model.dart';
import 'package:streamme/widgets/general_text.dart';

class StreamWidget extends StatelessWidget {
  final StreamModel streamModel;

  const StreamWidget({super.key, required this.streamModel});

  @override
  Widget build(BuildContext context) {
    AllStreamsPageController blocController = AllStreamsPageController.of(context);
    return InkWell(
      onTap: ()=> blocController.joinStream(streamModel),
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
        ),
        decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Color(0xFF33404A))),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GeneralText(
                          text: streamModel.user.firstName,
                          size: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
