import 'package:intl/intl.dart';

extension IntExtensions on int {
  String toFormattedFee() => NumberFormat.decimalPattern('fa_IR').format(this);
}
