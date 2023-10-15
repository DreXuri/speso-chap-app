final class StringUtil {
  static bool isEmpty(String? s) {
    return s == null || s.isEmpty;
  }

  static bool isNotEmpty(String? s) {
    return s != null && s.isNotEmpty;
  }

  static bool isValidEmail(String email) {
    return RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(email);
  }
}

String getTime() {
  final dateTime = DateTime.now();

  final String hour;
  final String minute;

  hour = dateTime.hour < 10 ? '0${dateTime.hour}' : '${dateTime.hour}';
  minute = dateTime.minute < 10 ? '0${dateTime.minute}' : '${dateTime.minute}';

  return '$hour:$minute';
}

String getDate() {
  DateTime today = DateTime.now();
  String dateTime =
      "${today.day.toString().padLeft(2, '0')} ${today.month.toString().padLeft(2, '0')}, ${today.year.toString()}";
  return '$dateTime';
}
