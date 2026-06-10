import 'package:flutter/material.dart';
import 'package:sport_flutter_app/core/ui/widgets/buttons/app_filled_button.dart';
import 'package:sport_flutter_app/core/ui/widgets/buttons/app_outlined_button.dart';

class SimplePage extends StatelessWidget {
  const SimplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: .center,
          spacing: 16,
          children: [
            Row(
              mainAxisAlignment: .center,
              mainAxisSize: .max,
              spacing: 16,
              children: [
                AppFilledButton(onPressed: null, title: 'سلام دادا'),
                AppFilledButton.secondary(onPressed: null, title: 'سلام دادا'),
              ],
            ),
            Row(
              mainAxisAlignment: .center,
              mainAxisSize: .max,
              spacing: 16,
              children: [
                AppFilledButton(onPressed: () {}, title: 'سلام دادا'),
                AppFilledButton.secondary(onPressed: () {}, title: 'سلام دادا'),
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: .center,
              mainAxisSize: .max,
              spacing: 16,
              children: [
                AppOutlinedButton(onPressed: null, title: 'سلام دادا'),
                AppOutlinedButton.secondary(
                  onPressed: null,
                  title: 'سلام دادا',
                ),
              ],
            ),
            Row(
              mainAxisAlignment: .center,
              mainAxisSize: .max,
              spacing: 16,
              children: [
                AppOutlinedButton(onPressed: () {}, title: 'سلام دادا'),
                AppOutlinedButton.secondary(
                  onPressed: () {},
                  title: 'سلام دادا',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
