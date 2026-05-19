import 'package:flutter/material.dart';
import 'package:sport_flutter_app/core/extensions/build_context_extensions.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: .center,
            children: [
              Text("سپهر فکوری هستم.", style: context.textTheme.displayLarge),
              Text("سپهر فکوری هستم.", style: context.textTheme.displayMedium),
              Text("سپهر فکوری هستم.", style: context.textTheme.displaySmall),
              Text("سپهر فکوری هستم.", style: context.textTheme.headlineLarge),
              Text("سپهر فکوری هستم.", style: context.textTheme.headlineMedium),
              Text("سپهر فکوری هستم.", style: context.textTheme.headlineSmall),
              Text("سپهر فکوری هستم.", style: context.textTheme.titleLarge),
              Text("سپهر فکوری هستم.", style: context.textTheme.titleMedium),
              Text("سپهر فکوری هستم.", style: context.textTheme.bodyLarge),
              Text("سپهر فکوری هستم.", style: context.textTheme.bodyMedium),
              Text("سپهر فکوری هستم.", style: context.textTheme.labelLarge),
              Text("سپهر فکوری هستم.", style: context.textTheme.labelSmall),
            ],
          ),
        ),
      ),
    );
  }
}
