import 'package:flutter/material.dart';

import '../constants.dart';
import '../size_config.dart';
import 'general_text.dart';

class GeneralButton extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color backgroundColor;
  final Color? borderColor;
  final Color? textColor;
  final void Function()? onPressed;
  final double widthMargin;
  final double heightMargin;
  final double? width;
  final double borderWidth;
  final double? height;
  final IconData? iconData;
  final double elevation;
  const GeneralButton({Key? key,required this.text,required this.onPressed, this.elevation = 0.0, this.backgroundColor = kPrimaryColor, this.textColor,this.borderColor, this.widthMargin = 0.0, this.fontSize=16, this.width=double.infinity, this.borderWidth=10, this.heightMargin=8, this.height = 54, this.iconData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      margin: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(widthMargin),vertical: getProportionateScreenHeight(heightMargin),),
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12,),
      ),
      width: width,
      child: RawMaterialButton(
        elevation: elevation,
        fillColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12,),
          side: borderColor != null ? BorderSide(color: borderColor!) : BorderSide.none,
        ),
        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 4),
        onPressed: onPressed,
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Row(
            children: [
              if(iconData != null)
                Row(
                  children: [
                    Icon(iconData, color: Colors.white, size: 18,),
                    const SizedBox(width: 4,),
                  ],
                ),
              GeneralText(
                text: text,
                color: textColor ?? Colors.white,
                isBold: true,
                size: fontSize,
                fontWeight: FontWeight.w700,
              ),
            ],
          ),
        ),
      ),
    );
  }
}