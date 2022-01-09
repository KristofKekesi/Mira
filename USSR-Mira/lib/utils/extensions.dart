// extensions on String
/// Extensions on [String]s.
extension StringExtension on String {
  /// Capitalises the [String].
  String capitalize() => "${this[0].toUpperCase()}${substring(1)}";
}

/// Adds trailing zeros to numbers smaller than 10.
String spacerZeros(int number) =>  number < 10 ? "0$number": number.toString();
