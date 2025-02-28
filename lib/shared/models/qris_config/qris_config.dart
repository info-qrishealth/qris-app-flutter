import 'package:freezed_annotation/freezed_annotation.dart';

part 'qris_config.freezed.dart';
part 'qris_config.g.dart';

@freezed
class QrisConfig with _$QrisConfig {
  factory QrisConfig(
      {required int id,
      @JsonKey(name: 'phone_number') required String phoneNumber,
      @JsonKey(name: 'whatsapp_number') required String whatsappNumber,
      @JsonKey(name: 'address') required String address,
      @JsonKey(name: 'map') required String map,
      @JsonKey(name: 'header_logo') required String headerLogo,
      @JsonKey(name: 'facebook_link') required String facebookLink,
      @JsonKey(name: 'twitter_link') required String twitterLink,
      @JsonKey(name: 'instagram_link') required String instagramLink,
      @JsonKey(name: 'linkedin_link') required String linkedinLink,
      @JsonKey(name: 'admin_email') required String adminEmail,
      @JsonKey(name: 'admin_phone') required String adminPhone,
      @JsonKey(name: 'fav_icon') required String favIcon,
      @JsonKey(name: 'category') required String category,
      @JsonKey(name: 'achievements') required String achievements,
      @JsonKey(name: 'ad_banner_2') required String adBanner2,
      @JsonKey(name: 'footer_logo') required String footerLogo,
      @JsonKey(name: 'footer_intro') required String footerIntro,
      @JsonKey(name: 'privacy_and_policy') required String privacyAndPolicy,
      @JsonKey(name: 'terms_and_conditions') required String termsAndConditions,
      @JsonKey(name: 'cancellation_policy') required String cancellationPolicy,
      @JsonKey(name: 'time_range') String? timeRange,
      @JsonKey(name: 'disable_date') String? disableDate,
      @JsonKey(name: 't_cat_risk_area') required String tCatRiskArea,
      @JsonKey(name: 't_cat_bad_habits') required String tCatBadHabits,
      @JsonKey(name: 'wcb_enable') required String wcbEnable,
      @JsonKey(name: 'wcb_amount') required double wcbAmount,
      @JsonKey(name: 'qc_enable') required String qcEnable,
      @JsonKey(name: 'qc_amount') required double qcAmount,
      @JsonKey(name: 'qc_used_coins') required double qcUsedCoins,
      @JsonKey(name: 'qc_min_cart_amt') required String qcMinCartAmt,
      @JsonKey(name: 'wcb_minorder_value') required double wcbMinorderValue,
      @JsonKey(name: 'scb_enable') required String scbEnable,
      @JsonKey(name: 'scb_amount') required double scbAmount,
      @JsonKey(name: 'ccb_enable') required String ccbEnable}) = _QrisConfig;

  factory QrisConfig.fromJson(Map<String, dynamic> json) =>
      _$QrisConfigFromJson(json);
}
