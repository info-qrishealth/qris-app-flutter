enum MarriedTitle { MR, MRS, MS, MST, Baby }

extension MarriedTitleExtension on MarriedTitle {
  int get number {
    return index + 1;
  }
}
