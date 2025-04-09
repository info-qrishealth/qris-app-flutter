import 'package:qris_health/constants/enums/scan_type.dart';

class SubscanModel {
  final String appBarTitle;
  final String imagePath;
  final String firstHeading;
  final String firstHeadingDescription;
  final List<Price> prices;
  final String secondTitle;
  final String secondDescription;
  final String whyToChooseTitle;
  final List<String> whyToChoose;
  final String thirdHeading;
  final List<HardcodedFaq> faqs;
  final ScanType scanType;

  SubscanModel(
      {required this.appBarTitle,
      required this.imagePath,
      required this.firstHeading,
      required this.firstHeadingDescription,
      required this.prices,
      required this.secondTitle,
      required this.secondDescription,
      required this.whyToChooseTitle,
      required this.whyToChoose,
      required this.thirdHeading,
      required this.faqs,
      required this.scanType});
}

class HardcodedFaq {
  final String question;
  final String answer;

  HardcodedFaq({required this.question, required this.answer});

  factory HardcodedFaq.fromJson(Map<String, dynamic> json) => HardcodedFaq(
        question: json["question"],
        answer: json["answer"],
      );

  Map<String, dynamic> toJson() => {
        "question": question,
        "answer": answer,
      };
}

class Price {
  final String title;
  final int mrp;
  final int offeredPrice;

  Price({
    required this.title,
    required this.mrp,
    required this.offeredPrice,
  });

  factory Price.fromJson(Map<String, dynamic> json) => Price(
        title: json["title"],
        mrp: json["mrp"],
        offeredPrice: json["offeredPrice"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "mrp": mrp,
        "offeredPrice": offeredPrice,
      };
}
