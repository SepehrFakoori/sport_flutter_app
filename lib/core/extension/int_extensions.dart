import 'package:intl/intl.dart';

extension IntX on int {
  String toFormattedFee() => NumberFormat.decimalPattern('fa_IR').format(this);
}
