// Flutter
import "package:flutter/material.dart";

///A [Widget] used when must return something, but don't want to see anything.
class Min extends StatelessWidget {
  /// Key
  const Min({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const SizedBox.shrink();
}
