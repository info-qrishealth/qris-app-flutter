import 'package:url_launcher/url_launcher.dart';

mixin GeneralHelperMixin {
  List<int> getIntsFromString({required String? string}) {
    if (string == null) {
      return [];
    }

    if (string.endsWith(',')) {
      string = string.substring(0, string.length - 1);
    }

    return string.split(',').map((e) => int.parse(e)).toList();
  }

  Future<void> openDialPad({required String phoneNumber}) async {
    final url = 'tel:$phoneNumber';

    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Couldn\'t launch url';
    }
  }

  String getBmiText({required double bmi}) {
    if (bmi < 18.5) {
      return 'Under Weight';
    } else if (bmi > 18.5 && bmi < 24.9) {
      return 'Normal Weight';
    } else if (bmi > 24.9 && bmi < 29.9) {
      return 'Overweight';
    } else {
      return 'Obesity';
    }
  }
}
