class AppInfo {
  AppInfo({
    this.minVersionCode,
    this.recommendedVersionCode,
  });

  final int? minVersionCode;
  final int? recommendedVersionCode;

  factory AppInfo.fromJson(Map<String, dynamic> json) => AppInfo(
        minVersionCode: json["minVersionCode"],
        recommendedVersionCode: json["recommendedVersionCode"],
      );

  Map<String, dynamic> toJson() => {
        "minVersionCode": minVersionCode,
        "recommendedVersionCode": recommendedVersionCode
      };
}
