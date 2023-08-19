import 'package:flutter/material.dart';
import 'package:streamme/core/extensions/buildcontext_extensions.dart';
import 'package:streamme/main.dart';
import 'package:streamme/widgets/general_text.dart';

import 'single_option_widget.dart';

showBottomOptionsWidget(String title, List<SingleOptionWidget> options) {
  showModalBottomSheet(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
    ),
    constraints: const BoxConstraints(
      minHeight: 50,
    ),
    context: navigatorKey.currentContext!,
    builder: (context) {
      return BottomSheetOptionsWidget(options: options, title: title,);
    },
  );
}

class BottomSheetOptionsWidget extends StatelessWidget {
  final String title;
  final List<SingleOptionWidget> options;
  const BottomSheetOptionsWidget({super.key, required this.options, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 50),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32)
          )
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 10,),
          Container(
            width: 50,
            height: 5,
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10)
            ),
          ),
          const SizedBox(height: 10,),
         Align(
           alignment:  context.isEnglish ? Alignment.centerLeft : Alignment.centerRight,
           child: Container(
             padding: const EdgeInsets.symmetric(horizontal: 20),
             child: GeneralText(text: title, fontWeight: FontWeight.w600, size: 18,),
           ),
         ),
          const SizedBox(height: 10,),
          if(options.length > 6)
          Expanded(
            child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: options,
                )
            ),
          )
          else
            ...options
        ],
      ),
    );
  }
}
