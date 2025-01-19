import 'dart:core';
import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime? {
  String getHMFromMinutes(int minutes) {
    final d = Duration(minutes: minutes);
    List<String> parts = d.toString().split(':');
    return '${parts[0].padLeft(2, '0')}:${parts[1].padLeft(2, '0')}';
  }

  bool get isToday {
    if (this == null) return false;

    final now = DateTime.now();
    return now.day == this!.day &&
        now.month == this!.month &&
        now.year == this!.year;
  }

  bool get isTomorrow {
    if (this == null) return false;

    final tomorrow = DateTime.now().add(const Duration(days: 1));
    return tomorrow.day == this!.day &&
        tomorrow.month == this!.month &&
        tomorrow.year == this!.year;
  }

  bool isEqualDayTo(DateTime? dateTime2) {
    if (this == null || dateTime2 == null) return false;
    dateTime2 = dateTime2.toLocal();

    if (this!.day == dateTime2.day &&
        this!.month == dateTime2.month &&
        this!.year == dateTime2.year) {
      return true;
    } else {
      return false;
    }
  }

  bool isInSameMonth(DateTime? dateTime2) {
    if (this == null || dateTime2 == null) return false;
    dateTime2 = dateTime2.toLocal();

    if (this!.month == dateTime2.month && this!.year == dateTime2.year) {
      return true;
    } else {
      return false;
    }
  }

  String getDurationInFormattedHours(Duration duration) {
    return duration.toString().split('.').first.padLeft(8, "0").substring(0, 5);
  }

  String? getDateWithMonth(DateTime? dateTime) {
    if (dateTime == null) return null;

    dateTime = dateTime.toLocal();
    return DateFormat().add_d().add_MMM().format(dateTime.toLocal());
  }

  String get getTimeStringFromDateTimeString {
    return DateFormat.jm().format(this!.toLocal()).toString();
  }

  String get getDetailedTimeStringFromDateTimeString {
    return DateFormat.jms().format(this!.toLocal()).toString();
  }

  String? get getFormattedDatedMMMy {
    if (this == null) return null;
    return DateFormat().add_d().add_MMM().add_y().format(this!.toLocal());
  }

  DateTime? get setStartTimeOfDayToDate {
    if (this == null) {
      return null;
    }

    return DateTime(this!.year, this!.month, this!.day, 00, 00, 0);
  }

  DateTime? get setEndTimeOfDayToDate {
    if (this == null) {
      return null;
    }

    return DateTime(this!.year, this!.month, this!.day, 23, 59, 59);
  }

  String? get getFormattedDate_yyyy_MM_dd {
    if (this == null) return null;
    return DateFormat("yyyy-MM-dd").format(this!);
  }

  int compareTo(DateTime dateTime) {
    if (dateTime.isBefore(this!)) {
      return -1;
    } else if (dateTime.isAfter(this!)) {
      return 1;
    }
    return 0;
  }

  int? get secondsTillNow {
    if (this == null) {
      return null;
    }

    final now = DateTime.now();

    return now
        .difference(DateTime(now.year, now.month, now.day, 00, 00, 00, 00, 00))
        .inSeconds;
  }

  String? get toConvertedTimeString {
    if (this == null) return null;

    final timeString =
        '${this!.year}${this!.month > 9 ? this!.month : '0${this!.month}'}${this!.day > 9 ? this!.day : '0${this!.day}'}${this!.hour > 9 ? this!.hour : '0${this!.hour}'}${this!.minute > 9 ? this!.minute : '0${this!.minute}'}${this!.second > 9 ? this!.second : '0${this!.second}'}';

    return timeString;
  }

  String? get formattedTimeAndDays {
    if (this == null) return null;
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = DateTime(now.year, now.month, now.day - 1);
    final dateToCheck = this!.toLocal();
    final aDate =
        DateTime(dateToCheck.year, dateToCheck.month, dateToCheck.day);

    if (aDate == today) {
      return 'today at ${DateFormat.jm().format(this!.toLocal())}';
    } else if (aDate == yesterday) {
      return 'yesterday at ${DateFormat.jm().format(this!.toLocal())}';
    } else {
      return '${DateFormat.yMMMd().format(this!.toLocal())} (${DateTime.now().difference(this!.toLocal()).inDays} days ago) at ${DateFormat.jm().format(this!.toLocal())}';
    }
  }

  String? get toTimestampForServer {
    if (this == null) {
      return null;
    }

    int unixTimestamp = this!.millisecondsSinceEpoch ~/ 1000;
    return unixTimestamp.toString();
  }
}
