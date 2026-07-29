import 'package:intl/intl.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

extension DateTimeX on DateTime {
  Jalali get jalali => Jalali.fromDateTime(this);

  // 24 July 2026, 14:44
  String formatLocalizedDateTime(String languageCode) =>
      DateFormat('d MMMM yyyy, HH:mm', languageCode).format(this);

  // 24 July 2026
  String formatLocalizedDate(String languageCode) =>
      DateFormat('d MMMM yyyy', languageCode).format(this);

  // 14:44
  String get formatTime => DateFormat('HH:mm').format(this);

  // 17:48 چهارشنبه 7 مرداد 1405
  String get formatPersianFullDateTime {
    return '$formatTime ${jalali.formatFullDate()}';
  }

  // چهارشنبه 7 مرداد 1405
  String get formatPersianFullDate => jalali.formatFullDate();

  // 7 مرداد 1405
  String get formatPersianDate {
    final f = jalali.formatter;

    return '${f.d} ${f.mN} ${f.yyyy}';
  }

  // 1405/05/07
  String get formatPersianNumericDate => jalali.formatCompactDate();
}
