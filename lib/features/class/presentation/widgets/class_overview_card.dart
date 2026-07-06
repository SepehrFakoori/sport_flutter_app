import 'package:flutter/material.dart';
import 'package:sport_flutter_app/core/ui/widgets/custom_card.dart';
import 'package:sport_flutter_app/core/ui/widgets/image_loader.dart';

class ClassOverviewCard extends StatelessWidget {
  const ClassOverviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomCard(
          child: Column(
            children: [
              ImageLoader(
                imageUrl:
                    'https://hs3.behtarino.com/media/business_images/876/209602702436.jpeg?x-img=v1%2Fautorotate%2Fv1%2Fresize%2Cw_416%2Ch_215%2Fv1%2Foptimize%2Cq_80%2Clossless_false',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
