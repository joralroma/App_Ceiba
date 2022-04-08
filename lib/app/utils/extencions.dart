// ignore_for_file: unnecessary_this

extension StringExtensions on String {

  bool get valid {
    return (this.trim().isNotEmpty);
  }

  String get capitalize {
    return '${this[0].toUpperCase()}${this.substring(1)}';
  }

}

extension DateTimeExtensions on DateTime {

  String get toTimeCard {
    return '${this.day}/${this.month}/${this.year}';
  }

}

extension StringNullExtensions on String? {

  bool get valid {
    return (this != null && this!.trim().isNotEmpty);
  }

}