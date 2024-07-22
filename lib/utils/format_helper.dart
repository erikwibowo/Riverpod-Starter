import 'package:intl/intl.dart';

class FormatHelper {
  static String currency(double number) {
    final currencyFormatter = NumberFormat.currency(
      locale: 'ID',
      decimalDigits: 0,
      symbol: "",
    );
    return currencyFormatter.format(number);
  }

  static String dateFormat(String stringDate) {
    DateTime date = DateTime.parse(stringDate);
    String formattedDate = DateFormat.yMMMMEEEEd("id_ID").format(date);
    return formattedDate;
  }

  static String monthFormat(String stringMonth) {
    DateTime date = DateTime.parse(stringMonth);
    String formattedDate = DateFormat.yMMMM("id_ID").format(date);
    return formattedDate;
  }
}
