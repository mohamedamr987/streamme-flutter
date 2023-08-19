import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:streamme/constants.dart';
import 'package:streamme/widgets/cache_image_widget.dart';
import 'package:streamme/widgets/general_text.dart';
enum ImageType{asset, network}
class SingleOptionWidget extends StatelessWidget {
  final String title;
  final String? image;
  final ImageType imageType;
  final void Function() onTap;
  const SingleOptionWidget({super.key, required this.title, this.image, required this.onTap, this.imageType = ImageType.asset});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xFFF6F5FA)))
      ),
      child: ListTile(
        horizontalTitleGap: 0,
        onTap: (){
          Navigator.pop(context);
          onTap();
        },
        leading: image != null ? imageType == ImageType.asset ? SvgPicture.asset("assets/images/$image.svg",) : CacheImageWidget(image: image!, fit: BoxFit.contain, width: 24, height: 24,) : null,
        title: GeneralText(text: title, fontWeight: FontWeight.w500,),
        trailing:  const Icon(Icons.arrow_forward_ios, color: kFontColor, size: 18,),
      ),
    );
  }
}
