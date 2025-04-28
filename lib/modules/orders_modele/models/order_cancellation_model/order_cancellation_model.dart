import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_cancellation_model.freezed.dart';
part 'order_cancellation_model.g.dart';

@freezed
class OrderCancellationModel with _$OrderCancellationModel {
  const factory OrderCancellationModel({
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'doctor_id') required String doctorId,
    @JsonKey(name: 'order_id') required String orderId,
    @JsonKey(name: 'txn_id') required String txnId,
    @JsonKey(name: 'cancellation_remark') required String cancellationRemark,
    @JsonKey(name: 'cancellation_comment') required String cancellationComment,
  }) = _OrderCancellationModel;

  factory OrderCancellationModel.fromJson(Map<String, dynamic> json) =>
      _$OrderCancellationModelFromJson(json);
}
