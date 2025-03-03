import 'package:freezed_annotation/freezed_annotation.dart';

part 'callback_request.freezed.dart';
part 'callback_request.g.dart';

@freezed
class CallbackRequest with _$CallbackRequest {
  const factory CallbackRequest(
      {required String name,
      required String phoneNumber,
      required String query}) = _CallbackRequest;

  factory CallbackRequest.fromJson(Map<String, dynamic> json) =>
      _$CallbackRequestFromJson(json);
}
