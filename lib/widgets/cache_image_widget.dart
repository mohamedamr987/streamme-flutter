import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class CacheImageWidget extends StatelessWidget {
  final String image;
  final BoxFit fit;
  final double? height;
  final double? width;
  final Color? color;
  const CacheImageWidget({Key? key, required this.image,required this.fit, this.height, this.width, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: fit ,
      imageUrl: image,
      height: height,
      width: width ,
      color: color,
      progressIndicatorBuilder: (context, url, downloadProgress) => Center(child: CircularProgressIndicator(value: downloadProgress.progress, color: kPrimaryColor,)),
      errorWidget: (context, url, error) => const Icon(Icons.error,color: kPrimaryColor,),
    );
  }
}

