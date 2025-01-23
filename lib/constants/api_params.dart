class ApiParams {
  ApiParams._();

  static ApiParams? _apiParams;

  static ApiParams? getInstance() {
    _apiParams ??= ApiParams._();
    return _apiParams;
  }

  String? authorization;
  String? phoneNumber;
  int? userId;
}
