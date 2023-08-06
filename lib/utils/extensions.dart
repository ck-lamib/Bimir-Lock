import 'package:intl/intl.dart';

extension DateFormatter on DateTime {
  String formatDate() {
    return DateFormat('yyyy-MM-dd').format(this);
  }
}
