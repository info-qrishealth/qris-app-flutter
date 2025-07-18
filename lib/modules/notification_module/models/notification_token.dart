import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_token.freezed.dart';
part 'notification_token.g.dart';

@freezed
class NotificationToken with _$NotificationToken {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory NotificationToken({
    int? userId,
    int? phleboId,
    required String token,
    required int platform,
    required String deviceIdentifier,
  }) = _NotificationToken;

  factory NotificationToken.fromJson(Map<String, dynamic> json) =>
      _$NotificationTokenFromJson(json);
}
