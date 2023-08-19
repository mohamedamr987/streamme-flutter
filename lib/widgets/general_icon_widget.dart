import 'package:flutter/material.dart';

class GeneralIconWidget extends StatelessWidget {
  final Widget child;
  final void Function() onTap;
  final Color? backgroundColor;
  const GeneralIconWidget({super.key, required this.onTap, required this.child, this.backgroundColor,});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        child: child
    );
  }
}
