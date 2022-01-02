// extensions on String
extension CapitalizeStringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}

String spacerZeros(number) =>  number < 10 ? "0$number": number.toString();