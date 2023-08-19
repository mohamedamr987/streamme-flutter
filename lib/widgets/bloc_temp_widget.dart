import 'package:flutter/material.dart';

import '../constants.dart';
import 'general_text.dart';

class BlocTempWidget extends StatelessWidget {
  final Widget successWidget;
  final bool errorState;
  final bool loadingState;
  final Color? loadingColor;
  final Widget? loadingWidget;
  final bool? emptyState;
  final String? emptyTitle;
  const BlocTempWidget({Key? key, required this.successWidget, required this.errorState, required this.loadingState,  this.emptyState,  this.emptyTitle, this.loadingWidget, this.loadingColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (loadingState) {
      return loadingWidget ??
           Center(
            child: CircularProgressIndicator(
              color: loadingColor??kPrimaryColor,
            ),
          );
    } else {
      return Column(
        mainAxisAlignment: errorState || loadingState ? MainAxisAlignment.center : MainAxisAlignment.start,
        mainAxisSize: errorState || loadingState ? MainAxisSize.max : MainAxisSize.min,
        children: [
          if(errorState)
             Center(
              child: Column(
                children: [
                  const SizedBox(height: 16,),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 80),
                    child: GeneralText(
                      text: kErrorText,
                      size: 16,
                      isBold: true,
                      fontWeight: FontWeight.w600,
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              )
            )
          else if (emptyState != null && emptyState!)
            Center(
              child: GeneralText(
                text: "There is no ${emptyTitle!}",
                size: 26,
                isBold: true,
                textAlign: TextAlign.center,
              ),
            )
          else
            successWidget,
        ],
      );
    }
  }
}
