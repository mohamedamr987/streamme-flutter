import 'package:flutter/material.dart';


const Color kPrimaryColor = Color(0xFF6149AF);

const Color kFontColor = Color(0xFF0C090F);
const Color kFontSecondaryColor = Color(0xFF989898);
const Color kBackgroundColor = Color(0xFFFEFEFF);
const Color kIconColor = Color(0xFF686868);
const Color kSuccess = Color(0xFF09C865);


const String kPersonImage = "https://i.ibb.co/ZftCwrp/person-icon.png";
const String kGoogleApiKey = "AIzaSyASxQx0Srr852F6RrM00R7rX_UmsMeW9U8";

String kErrorText = "Something went wrong";

List<BoxShadow> kShadow = [
  BoxShadow(
    color: Colors.grey.withOpacity(0.5),
    // spreadRadius: 5,
    blurRadius: 2,
    offset: const Offset(0, 5), // changes position of shadow
  ),
];

BorderRadius kRadiusBorder =  const BorderRadius.all(Radius.circular(4.0),);
const String kInstagramUrl = "https://instagram.com/league.pls?igshid=MzRlODBiNWFlZA==";

UnderlineInputBorder kAppBarBorder = UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey.withOpacity(0.4),),);

BoxShadow shadow = BoxShadow(
  color: Colors.grey.withOpacity(0.3),
  spreadRadius: 2,
  blurRadius: 5,
  offset: const Offset(0, 3), // changes position of shadow
);
OutlineInputBorder getBorderStyle(Color color, double borderWidth )
{
  return OutlineInputBorder(
    borderRadius: const BorderRadius.all(Radius.circular(16.0),),
    borderSide: BorderSide(color: color,width:borderWidth ),
  );
}
