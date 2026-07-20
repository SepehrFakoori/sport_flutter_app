import 'dart:io';
import 'dart:ui';
import 'package:image_cropper/image_cropper.dart';

class ImageCropperService {
  Future<File?> crop({
    required String sourcePath,
    required CropTheme theme,
  }) async {
    final result = await ImageCropper().cropImage(
      sourcePath: sourcePath,
      aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
      uiSettings: [
        AndroidUiSettings(
          lockAspectRatio: true,
          hideBottomControls: false,
          backgroundColor: theme.background,
          cropFrameColor: theme.surface,
          activeControlsWidgetColor: theme.primary,
          dimmedLayerColor: theme.background.withValues(alpha: 0.75),
          toolbarColor: theme.background,
          toolbarWidgetColor: theme.onBackground,
          cropGridColor: theme.surface,
          statusBarLight: true,
          cropStyle: .circle,
          showCropGrid: false,
          navBarLight: true,
          toolbarTitle: theme.title,
        ),
        IOSUiSettings(aspectRatioLockEnabled: true),
      ],
    );
    return result != null ? File(result.path) : null;
  }
}

/// Plain-data theme snapshot, built from context once in the widget layer,
/// so the service/use case/bloc never depend on BuildContext.
class CropTheme {
  final Color background;
  final Color surface;
  final Color primary;
  final Color onBackground;
  final String title;

  const CropTheme({
    required this.background,
    required this.surface,
    required this.primary,
    required this.onBackground,
    required this.title,
  });
}
