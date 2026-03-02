import 'package:freezed_annotation/freezed_annotation.dart';

part 'free_consultation_request.freezed.dart';
part 'free_consultation_request.g.dart';

@freezed
class FreeConsultationRequest with _$FreeConsultationRequest {
  const factory FreeConsultationRequest({
    @JsonKey(name: 'orderId') required int orderId,
    @JsonKey(name: 'patientIds') required List<String> patientIds,
  }) = _FreeConsultationRequest;

  factory FreeConsultationRequest.fromJson(Map<String, dynamic> json) =>
      _$FreeConsultationRequestFromJson(json);
}


