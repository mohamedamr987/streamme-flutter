import 'package:flutter/material.dart';
import 'package:streamme/constants.dart';
import 'package:streamme/core/extensions/buildcontext_extensions.dart';
import 'package:streamme/widgets/general_icon_widget.dart';

class BackIconWidget extends StatelessWidget {
  final IconData icon;
  final Color color;
  final Function()? onTap;
  final EdgeInsets? margin;
  const BackIconWidget({
    Key? key,
    this.icon = Icons.arrow_back_ios_outlined,
    this.color = kFontColor, this.onTap,
    this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: GeneralIconWidget(
        onTap: onTap ?? () => Navigator.pop(context),
        child: Icon(icon, color: color, textDirection: context.isEnglish ? TextDirection.ltr : TextDirection.rtl, size: 18,),
      ),
    );
  }
}
