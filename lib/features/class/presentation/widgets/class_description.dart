import 'package:flutter/material.dart';
import 'package:sport_flutter_app/core/extension/build_context_extensions.dart';
import 'package:sport_flutter_app/core/constant/constants.dart';
import 'package:sport_flutter_app/core/ui/widgets/icon_widget.dart';

class ClassDescription extends StatefulWidget {
  final String description;

  const ClassDescription({super.key, required this.description});

  @override
  State<ClassDescription> createState() => _ClassDescriptionState();
}

class _ClassDescriptionState extends State<ClassDescription> {
  bool _expand = false;

  final int defaultMaxLines = 3;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const .symmetric(horizontal: AppSpacing.lg),
      child: Column(
        crossAxisAlignment: .start,
        spacing: AppSpacing.xs,
        children: [
          Text(
            context.l10n.class_description,
            style: context.textTheme.headlineSmall,
          ),
          AnimatedSize(
            duration: AppDuration.normal,
            curve: Curves.easeInOut,
            child: Text(
              widget.description,
              maxLines: _expand ? null : defaultMaxLines,
              overflow: _expand ? .visible : .ellipsis,
            ),
          ),
          GestureDetector(
            onTap: () => setState(() => _expand = !_expand),
            child: SizedBox(
              height: 24,
              child: Row(
                mainAxisAlignment: .center,
                mainAxisSize: .max,
                children: [
                  AnimatedRotation(
                    duration: AppDuration.normal,
                    curve: Curves.easeInOut,
                    turns: _expand ? 0.5 : 0,
                    child: IconWidget(
                      icon: AppIcons.arrowDown,
                      color: context.colors.secondary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
