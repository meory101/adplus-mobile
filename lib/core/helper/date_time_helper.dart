import 'package:easy_localization/easy_localization.dart';
/*nour othman*/
abstract class DateTimeHelper {
  static String formatDateMonthDayYear({required String date}) {
    if(date.isEmpty)return"";
    return DateFormat("MM/dd/yyyy")
        .format(DateTime.parse(date).toLocal());
  }
  static String formatMillisecondsToDate({required int milliseconds}) {
    if (milliseconds <= 0) return "";
    return DateFormat("MM/dd/yyyy")
        .format(DateTime.fromMillisecondsSinceEpoch(milliseconds).toLocal());
  }
  static String formatDateObjectMonthDayYear({required DateTime? date}) {
    if(date == null) return"";
    return DateFormat("MM/dd/yyyy")
        .format(date.toLocal());
  }

  static DateTime convertToLocal({required DateTime date}) {
    return date.toLocal();
  }
  static num? convertToMilliseconds({required DateTime? date}) {
    if(date == null) return null;
    return date.millisecondsSinceEpoch;

  }



}
