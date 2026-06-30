import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:sport_flutter_app/core/extensions/build_context_extensions.dart';
import 'package:sport_flutter_app/core/ui/widgets/image_loader.dart';

class ClassImages extends StatefulWidget {
  const ClassImages({super.key, required this.images});

  final List<String> images;

  @override
  State<ClassImages> createState() => _ClassImagesState();
}

class _ClassImagesState extends State<ClassImages> {
  late final PageController controller;

  @override
  void initState() {
    super.initState();
    controller = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        PageView.builder(
          controller: controller,
          itemCount: 3,
          itemBuilder: (context, index) =>
              ImageLoader(imageUrl: widget.images[index], radius: 0),
        ),
        Positioned(
          bottom: 10,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
            child: SmoothPageIndicator(
              controller: controller,
              count: widget.images.length,
              effect: ExpandingDotsEffect(
                expansionFactor: 4,
                dotHeight: 6,
                dotWidth: 6,
                dotColor: context.colors.divider,
                activeDotColor: context.colors.background,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
