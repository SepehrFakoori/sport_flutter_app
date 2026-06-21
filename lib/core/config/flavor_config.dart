import 'package:flutter/services.dart';

bool get isProduction => appFlavor == 'production';

bool get isStaging => appFlavor == 'staging';

bool get isDevelopment => appFlavor == 'development';
