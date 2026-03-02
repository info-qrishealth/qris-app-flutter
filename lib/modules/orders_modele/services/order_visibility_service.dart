class OrderVisibilityService {
  static const Duration _visibilityDuration = Duration(hours: 24);

  static bool shouldShowOrder({
    required String orderStatus,
    required DateTime? reportGeneratedDate,
  }) {
    if (orderStatus == 'Order Cancelled') {
      return false;
    }

    if (orderStatus != 'Report Generated') {
      return true;
    }

    if (reportGeneratedDate == null) {
      return true;
    }

    final generatedAtUtc = reportGeneratedDate.isUtc
        ? reportGeneratedDate
        : reportGeneratedDate.toUtc();
    final nowUtc = DateTime.now().toUtc();
    final timeSinceGeneration = nowUtc.difference(generatedAtUtc);

    if (timeSinceGeneration.isNegative) {
      return true;
    }

    return timeSinceGeneration < _visibilityDuration;
  }
}

