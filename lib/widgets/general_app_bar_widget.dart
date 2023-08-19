import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:streamme/constants.dart';

import 'back_icon_widget.dart';
import 'general_text.dart';

AppBar generalAppBar({
  required String title,
  bool haveBackButton = true,
  Widget? extraWidgetInTitle,
  List<Widget>? actions,
  IconData? backIcon,
  Color? backgroundColor,
  SystemUiOverlayStyle? systemUiOverlayStyle,
  double titleSize = 14,
  double elevation = 0.0,
  ShapeBorder? shapeBorder,
  Color? color,
  void Function()? onTap,
  void Function()? backOnTap,
}) =>
    AppBar(
      shape: shapeBorder,
      automaticallyImplyLeading: false,
      actions: actions,
      leading: haveBackButton? BackIconWidget(icon: backIcon ?? Icons.arrow_back_ios_outlined, onTap: backOnTap, margin: const EdgeInsets.all(6), color: color??kFontColor,): null,
      backgroundColor:backgroundColor?? kBackgroundColor,
      centerTitle: true,
      elevation: elevation,
      systemOverlayStyle: systemUiOverlayStyle,
      title: extraWidgetInTitle != null ? InkWell(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            extraWidgetInTitle,
            const SizedBox(width: 12,),
            GeneralText(text: title, isBold: true, size: titleSize, color: color, textDirection: TextDirection.ltr,),
            const SizedBox(width: 40,),
          ],
        ),
      ):
      GeneralText(text: title, isBold: true, size: titleSize, color: color, textDirection: TextDirection.ltr,),
      toolbarHeight: extraWidgetInTitle != null ? 80 : null,
    );