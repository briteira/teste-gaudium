import 'package:intl/intl.dart';

class StringUtil {
  static String doubleToString(double value){
    final formatter = NumberFormat("#,##0.00", "pt_BR");
    return formatter.format(value);
  }
}