// ignore_for_file: depend_on_referenced_packages

import 'package:intl/intl.dart';

extension DoubleExtension on double? {
  String toCurrency() {
    final oCcy = NumberFormat("#,##0.00", "en_US");
    return oCcy.format(this);
  }
}
