import 'package:flutter/material.dart';

class BottomSheetPage<T> extends Page<T> {
  const BottomSheetPage({
    super.key,
    required this.child,
    required this.isScrollControlled,
  });

  final Widget child;
  final bool isScrollControlled;

  @override
  Route<T> createRoute(BuildContext context) {
    return ModalBottomSheetRoute(
      settings: this,
      builder: (context) {
        return (ModalRoute.of(context)?.settings as BottomSheetPage).child;
      },
      isScrollControlled: isScrollControlled,
    );
  }
}
