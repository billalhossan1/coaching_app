import 'package:intl/intl.dart';

import 'package:intl/intl.dart';

class FormatTime {
  static String formateTime(String? dateString) {
    if (dateString == null || dateString.isEmpty) return '';
    try {
      DateTime utcTime = DateTime.parse(dateString).toUtc();
      DateTime bstTime = utcTime.add(const Duration(hours: 6));
      return DateFormat('hh:mm a').format(bstTime);
    } catch (e) {
      return '';
    }
  }

  static String formateDateTimeMonth(String? isoString) {
    if (isoString == null || isoString.isEmpty) return '';
    try {
      DateTime utcTime = DateTime.parse(isoString).toUtc();
      DateTime bstTime = utcTime.add(const Duration(hours: 6));
      return DateFormat('MMM d, y, h:mma').format(bstTime);
    } catch (e) {
      return '';
    }
  }

  static String formateDate(String? dateString) {
    if (dateString == null || dateString.isEmpty) return '';
    try {
      DateTime utcTime = DateTime.parse(dateString).toUtc();
      DateTime bstTime = utcTime.add(const Duration(hours: 6));
      return DateFormat('dd/MM/yyyy').format(bstTime);
    } catch (e) {
      return '';
    }
  }

  static String formateDateMonth(String? dateString) {
    if (dateString == null || dateString.isEmpty) return '';
    try {
      DateTime utcTime = DateTime.parse(dateString).toUtc();
      DateTime bstTime = utcTime.add(const Duration(hours: 6));
      return DateFormat('dd MMM').format(bstTime);
    } catch (e) {
      return '';
    }
  }

  static String formateDateMonthYear(String? dateString) {
    if (dateString == null || dateString.isEmpty) return '';
    try {
      DateTime utcTime = DateTime.parse(dateString).toUtc();
      DateTime bstTime = utcTime.add(const Duration(hours: 6));
      return DateFormat('dd MMM, yyyy').format(bstTime);
    } catch (e) {
      return '';
    }
  }

  static String profileDateOfBirth(String? dateString) {
    if (dateString == null || dateString.isEmpty) return '';
    try {
      DateTime utcTime = DateTime.parse(dateString).toUtc();
      DateTime bstTime = utcTime.add(const Duration(hours: 6));
      return DateFormat('yyyy-MM-dd').format(bstTime);
    } catch (e) {
      return '';
    }
  }
}

class ShortText {
  static String getShortText(String? text, {int maxLength = 20}) {
    if (text == null) return '';
    return text.length > maxLength ? '${text.substring(0, maxLength)}...' : text;
  }
}
