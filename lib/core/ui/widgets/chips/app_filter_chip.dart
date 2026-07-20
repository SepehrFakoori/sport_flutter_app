import 'package:flutter/material.dart';
import 'package:sport_flutter_app/core/extension/build_context_extensions.dart';
import 'package:sport_flutter_app/core/ui/widgets/cached_network_svg.dart';

class AppFilterChip extends StatelessWidget {
  final String title;
  final String url;
  final bool selected;
  final ValueChanged<bool> onSelected;

  const AppFilterChip({
    super.key,
    required this.title,
    required this.url,
    required this.selected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    final Color color = selected
        ? context.colors.primary
        : context.colors.onBackgroundSecondary;

    return FilterChip(
      avatar: CachedNetworkSvg(url: url, color: color),
      label: Text(title),
      tooltip: title,
      labelStyle: context.textTheme.labelLarge?.copyWith(
        color: color,
        fontWeight: selected ? .w600 : .w400,
      ),
      side: BorderSide(color: color, width: 1.2),
      selected: selected,
      showCheckmark: false,
      onSelected: onSelected,
    );
  }
}
