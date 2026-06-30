import 'package:flutter/material.dart';
import 'package:sport_flutter_app/core/extension/build_context_extensions.dart';

class AppExpansionTile extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const AppExpansionTile({
    super.key,
    required this.title,
    this.children = const <Widget>[],
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(title, style: context.textTheme.titleLarge),
      controlAffinity: ListTileControlAffinity.platform,
      initiallyExpanded: false,
      expandedCrossAxisAlignment: .start,
      expandedAlignment: Alignment.topRight,
      children: children,
    );
  }
}
