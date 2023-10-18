// ignore_for_file: depend_on_referenced_packages

import 'package:intl/intl.dart';

// A lot of extension methods for displaying date time and other things
extension DateTimeExtensions on DateTime {
  String formatMMMddYYYY() {
    final formatter = DateFormat('MMM dd, yyyy');
    return formatter.format(this);
  }

  String formatMMMM() {
    final formatter = DateFormat('MMMM');
    return formatter.format(this);
  }

  String formatMMM() {
    final formatter = DateFormat('MMM');
    return formatter.format(this);
  }

  String formatMMMdd() {
    final formatter = DateFormat('MMM dd');
    return formatter.format(this);
  }

  String formatMMMMd() {
    final formatter = DateFormat.MMMMd();
    return formatter.format(this);
  }

  String formatMMddYYYY() {
    final formatter = DateFormat('MM/dd/yyyy');
    return formatter.format(this);
  }

  String formatMMddYY() {
    final formatter = DateFormat('MM/dd/yy');
    return formatter.format(this);
  }

  String formatDateWithTime() {
    final formatter = DateFormat('M/d/yy, hh:mm a');
    return formatter.format(this);
  }

  String formatMMMddHHmm() {
    final formatter = DateFormat('MMM dd, hh:mm a');
    return formatter.format(this);
  }

  String formatHourMinutes() {
    final formatter = DateFormat('hh:mm');
    return formatter.format(this);
  }

  bool isToday({bool toLocal = false}) {
    final now = DateTime.now();
    var target = this;
    if (toLocal) {
      target = this.toLocal();
    }

    return target.year == now.year &&
        target.month == now.month &&
        target.day == now.day;
  }

  bool isTomorrow({bool toLocal = false}) {
    final tomorrow = DateTime.now().add(const Duration(days: 1));
    var target = this;
    if (toLocal) {
      target = this.toLocal();
    }

    return target.year == tomorrow.year &&
        target.month == tomorrow.month &&
        target.day == tomorrow.day;
  }

  DateTime toStartOfDay() {
    return DateTime(year, month, day);
  }

  DateTime toEndOfDay() {
    return DateTime(year, month, day, 23, 59, 59, 999, 999);
  }
}
