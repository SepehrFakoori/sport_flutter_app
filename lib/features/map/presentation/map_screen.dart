import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:sport_flutter_app/core/extension/build_context_extensions.dart';
import 'package:sport_flutter_app/core/ui/widgets/app_pressable_scale.dart';
import 'package:sport_flutter_app/core/ui/widgets/custom_card.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FlutterMap(
          options: MapOptions(
            initialCenter: LatLng(36.2530, 50.1755),
            initialZoom: 15,
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'com.example.sport_flutter_app.development',
            ),
            MarkerLayer(
              alignment: .center,
              rotate: true,
              markers: [
                Marker(
                  point: LatLng(36.2530, 50.1755),
                  width: 100,
                  height: 36,
                  alignment: .center,
                  child: AppPressableScale(
                    isActive: true,
                    child: CustomCard(
                      child: Padding(
                        padding: const .symmetric(
                          horizontal: 16.0,
                          vertical: 8.0,
                        ),
                        child: Text(
                          'فوتبال',
                          maxLines: 1,
                          overflow: .ellipsis,
                          style: context.textTheme.labelLarge?.copyWith(
                            fontWeight: .w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
