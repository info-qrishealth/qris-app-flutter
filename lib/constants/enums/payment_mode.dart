enum PaymentMode { razorpay, cod, online, prepaid }

extension PaymentModeExtension on PaymentMode {
  String get value {
    switch (this) {
      case PaymentMode.cod:
        return 'cod';
      case PaymentMode.online:
        return 'online';
      case PaymentMode.prepaid:
        return 'pre-paid';
      case PaymentMode.razorpay:
        return 'razorpay';
    }
  }

  static PaymentMode fromString(String value) {
    switch (value) {
      case 'cod':
        return PaymentMode.cod;
      case 'online':
        return PaymentMode.online;
      case 'pre-paid':
        return PaymentMode.prepaid;
      case 'razorpay':
        return PaymentMode.razorpay;
      default:
        throw ArgumentError('Invalid PaymentMode: $value');
    }
  }
}
