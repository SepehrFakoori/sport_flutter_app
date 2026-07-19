import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sport_flutter_app/core/ui/widgets/image_loader.dart';

class AppBannerCarousel extends StatelessWidget {
  final List<String> imageUrls;
  final VoidCallback onTap;
  final double aspectRatio;
  final double viewportFraction;
  final bool autoPlay;
  final double borderRadius;
  final EdgeInsetsGeometry itemPadding;

  const AppBannerCarousel({
    super.key,
    required this.imageUrls,
    required this.onTap,
    this.aspectRatio = 21 / 9,
    this.viewportFraction = 0.85,
    this.autoPlay = true,
    this.borderRadius = 12,
    this.itemPadding = const .symmetric(horizontal: 8.0),
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemBuilder: (context, index, realIndex) => Padding(
        padding: itemPadding,
        child: GestureDetector(
          onTap: onTap,
          child: ImageLoader(
            imageUrl: imageUrls[index],
            radius: borderRadius,
            width: double.infinity,
          ),
        ),
      ),
      itemCount: imageUrls.length,
      options: CarouselOptions(
        aspectRatio: aspectRatio,
        viewportFraction: viewportFraction,
        autoPlay: autoPlay,
        scrollDirection: .horizontal,
        pageSnapping: true,
      ),
    );
  }
}
