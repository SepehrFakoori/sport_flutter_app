import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sport_flutter_app/core/constant/app_icons.dart';
import 'package:sport_flutter_app/core/extension/build_context_extensions.dart';
import 'package:sport_flutter_app/core/ui/widgets/icon_widget.dart';
import 'package:sport_flutter_app/core/ui/widgets/skeleton/skeleton_box.dart';

class CachedNetworkSvg extends StatefulWidget {
  final String url;
  final Color? color;
  final double size;

  const CachedNetworkSvg({
    super.key,
    required this.url,
    this.color,
    this.size = 24,
  });

  @override
  State<CachedNetworkSvg> createState() => _CachedNetworkSvgState();
}

class _CachedNetworkSvgState extends State<CachedNetworkSvg> {
  late Future<File> _fileFuture;

  @override
  void initState() {
    super.initState();
    _fileFuture = DefaultCacheManager().getSingleFile(widget.url);
  }

  @override
  void didUpdateWidget(covariant CachedNetworkSvg oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.url != widget.url) {
      _fileFuture = DefaultCacheManager().getSingleFile(widget.url);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<File>(
      future: _fileFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState != .done) {
          return SkeletonBox(width: widget.size, height: widget.size);
        }
        if (snapshot.hasError || !snapshot.hasData) {
          return IconWidget(icon: AppIcons.edit);
        }
        return SvgPicture.file(
          snapshot.data!,
          fit: BoxFit.cover,
          height: widget.size,
          width: widget.size,
          colorFilter: ColorFilter.mode(
            widget.color ?? context.colorScheme.onSurface,
            BlendMode.srcIn,
          ),
        );
      },
    );
  }
}
