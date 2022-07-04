import 'package:intl/intl.dart';

extension extensionString on String {
  String initial() {
    return this.isNotEmpty ? this.trim().split(RegExp(' +')).map((s) => s[0]).take(2).join().toUpperCase() : '';
  }

  String get titleProduct {
    var name = this.isNotEmpty ? this.trim().split(RegExp(' +')).take(2).join(" ") : '';
    if (name.length > 15) {
      return name.split(RegExp(' +')).take(1).join() + " ...";
    }
    return name;
  }

  int? toNumber() {
    if (this.length > 0) {
      return int.parse(this);
    }
    return null;
  }

  double? toDouble() {
    if (this.length > 0) {
      return double.parse(this);
    }
    return null;
  }
}

extension extensionInt on int {
  String toIDR({decimalDigit = 0}) {
    NumberFormat currencyFormatter = NumberFormat.currency(
      locale: 'id',
      symbol: 'Rp ',
      decimalDigits: decimalDigit,
    );
    return currencyFormatter.format(this);
  }
}