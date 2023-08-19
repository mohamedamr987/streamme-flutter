import 'package:flutter/material.dart';
import 'package:streamme/core/helpers/pagination_handler.dart';

import '../constants.dart';

class PaginationLoadingWrapWidget extends StatelessWidget {
  final Widget child;
  final PaginationHandler paginationHandler;
  final Color? color;
  const PaginationLoadingWrapWidget({Key? key, required this.child, required this.paginationHandler, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        child,
        if(paginationHandler.isLoading)
          Container(
            margin: const EdgeInsets.symmetric(vertical: 12,),
            child: CircularProgressIndicator(color: color??kPrimaryColor,),
          )
      ],
    );
  }
}
