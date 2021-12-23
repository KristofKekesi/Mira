// extensions on String
extension CapitalizeStringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}

String spacerZeros(int) =>  int < 10 ? "0$int": int.toString();