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
}
