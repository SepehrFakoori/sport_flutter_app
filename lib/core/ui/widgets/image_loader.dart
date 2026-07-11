import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:sport_flutter_app/core/ui/widgets/skeleton/skeleton_box.dart';

class ImageLoader extends StatelessWidget {
  final String? imageUrl;
  final double height;
  final double width;
  final double radius;
  final BoxFit? fit;

  const ImageLoader({
    super.key,
    required this.imageUrl,
    this.height = 140,
    this.width = 140,
    this.radius = 8,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl ?? "",
      imageBuilder: (context, imageProvider) {
        return Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            image: DecorationImage(image: imageProvider, fit: fit),
          ),
        );
      },
      errorWidget: (context, url, error) => Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Color(0xffeaeaea),
          borderRadius: BorderRadius.circular(radius),
        ),
        child: Center(child: Icon(Icons.image_not_supported_outlined)),
      ),
      progressIndicatorBuilder: (context, _, progress) => SkeletonBox(
        width: width,
        height: height,
        radius: BorderRadius.circular(radius),
        shape: BoxShape.rectangle,
      ),
      placeholderFadeInDuration: Duration(milliseconds: 500),
    );
  }
}
