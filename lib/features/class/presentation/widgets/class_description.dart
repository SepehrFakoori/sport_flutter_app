import 'package:flutter/material.dart';
import 'package:sport_flutter_app/core/extension/build_context_extensions.dart';

class ClassDescription extends StatefulWidget {
  final String description;

  const ClassDescription({super.key, required this.description});

  @override
  State<ClassDescription> createState() => _ClassDescriptionState();
}

class _ClassDescriptionState extends State<ClassDescription> {
  bool expanded = false;

  bool _isTextOverflowing(BuildContext context, String text, double maxWidth) {
    final textPainter = TextPainter(
      text: TextSpan(text: text, style: DefaultTextStyle.of(context).style),
      maxLines: 2,
      textDirection: TextDirection.rtl,
    )..layout(maxWidth: maxWidth);

    return textPainter.didExceedMaxLines;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const .symmetric(horizontal: 16.0),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final hasOverflow = _isTextOverflowing(
            context,
            widget.description,
            constraints.maxWidth,
          );

          return Column(
            crossAxisAlignment: .start,
            spacing: 4,
            children: [
              Text(
                context.l10n.class_description,
                style: context.textTheme.headlineSmall,
              ),
              AnimatedSize(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                child: Text(
                  widget.description,
                  key: ValueKey(expanded),
                  maxLines: expanded ? null : 2,
                  textAlign: .justify,
                ),
              ),
              if (hasOverflow)
                Center(
                  heightFactor: 0.6,
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        expanded = !expanded;
                      });
                    },
                    style: TextButton.styleFrom(
                      overlayColor: Colors.transparent,
                      padding: EdgeInsets.zero,
                    ),
                    child: Text(expanded ? 'نمایش کمتر' : 'نمایش بیشتر'),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
