import 'package:easy_localization/easy_localization.dart';

class DateFormatter {
  static final String _now = 'now'.tr();
  static final String _secondAgo = 'second_ago'.tr();
  static final String _secondsAgo = 'seconds_ago'.tr();
  static final String _minuteAgo = 'minute_ago'.tr();
  static final String _minutesAgo = 'minutes_ago'.tr();
  static final String _hourAgo = 'hour_ago'.tr();
  static final String _hoursAgo = 'hours_ago'.tr();
  static final String _dayAgo = 'day_ago'.tr();
  static final String _daysAgo = 'days_ago'.tr();

  static final List<String> _weekdayList = [
    'monday'.tr(),
    'tuesday'.tr(),
    'wednesday'.tr(),
    'thursday'.tr(),
    'friday'.tr(),
    'saturday'.tr(),
    'sunday'.tr(),
  ];

  static final List<String> _monthList = [
    'january'.tr(),
    'february'.tr(),
    'march'.tr(),
    'april'.tr(),
    'may'.tr(),
    'june'.tr(),
    'july'.tr(),
    'august'.tr(),
    'september'.tr(),
    'october'.tr(),
    'november'.tr(),
    'december'.tr(),
  ];

  static String formatWeekday(int weekday) => _weekdayList[weekday - 1];

  static String formatMonth(int month) => _monthList[month - 1];

  static String formatDate({
    required DateTime date,
    bool includeWeekday = false,
    bool includeTime = false,
  }) {
    String fDate = '${date.day} ${formatMonth(date.month)} ${date.year}';
    if (includeWeekday) fDate += ' ${formatWeekday(date.weekday)}';
    if (includeTime) fDate += ' ${date.hour}:${date.minute}';
    return fDate;
  }

  static String formatDateDifference({
    required DateTime date,
    bool includeWeekday = false,
    bool includeTime = false,
  }) {
    DateTime now = DateTime.now();
    Duration difference = now.difference(date);
    if (difference.inSeconds < 1) {
      return _now;
    } else if (difference.inSeconds < 60) {
      if (difference.inSeconds == 1) {
        return '${difference.inSeconds} $_secondAgo';
      } else {
        return '${difference.inSeconds} $_secondsAgo';
      }
    } else if (difference.inMinutes < 60) {
      if (difference.inMinutes == 1) {
        return '${difference.inMinutes} $_minuteAgo';
      } else {
        return '${difference.inMinutes} $_minutesAgo';
      }
    } else if (difference.inHours < 24) {
      if (difference.inHours == 1) {
        return '${difference.inHours} $_hourAgo';
      } else {
        return '${difference.inHours} $_hoursAgo';
      }
    } else if (difference.inDays < 7) {
      if (difference.inDays == 1) {
        return '${difference.inDays} $_dayAgo';
      } else {
        return '${difference.inDays} $_daysAgo';
      }
    } else {
      return formatDate(
        date: date,
        includeWeekday: includeWeekday,
        includeTime: includeTime,
      );
    }
  }
}
