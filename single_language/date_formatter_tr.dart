class DateFormatter {
  static const String _now = 'Şimdi';
  static const String _secondAgo = 'saniye önce';
  static const String _secondsAgo = 'saniye önce';
  static const String _minuteAgo = 'dakika önce';
  static const String _minutesAgo = 'dakika önce';
  static const String _hourAgo = 'saat önce';
  static const String _hoursAgo = 'saat önce';
  static const String _dayAgo = 'gün önce';
  static const String _daysAgo = 'gün önce';

  static const List<String> _weekdayList = [
    'Pazartesi',
    'Salı',
    'Çarşamba',
    'Perşembe',
    'Cuma',
    'Cumartesi',
    'Pazar',
  ];

  static const List<String> _monthList = [
    'Ocak',
    'Şubat',
    'Mart',
    'Nisan',
    'Mayıs',
    'Haziran',
    'Temmuz',
    'Ağustos',
    'Eylül',
    'Ekim',
    'Kasım',
    'Aralık',
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
