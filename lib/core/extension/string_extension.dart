extension StringExtension on String {
  String onlyNumbers() {
    return replaceAll(RegExp(r'[^0-9]'), '');
  }
}
