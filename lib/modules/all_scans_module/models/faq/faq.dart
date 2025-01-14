import 'package:freezed_annotation/freezed_annotation.dart';

part 'faq.freezed.dart';
part 'faq.g.dart';

@freezed
class Faq with _$Faq {
  const factory Faq(
      {required int id,
      @JsonKey(name: 'test_id') required int testId,
      required String question,
      required String answer,
      @JsonKey(name: 'dis_order') required int disOrder,
      required String status}) = _Faq;

  factory Faq.fromJson(Map<String, dynamic> json) => _$FaqFromJson(json);
}
