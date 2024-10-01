import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class LoadingAnimation extends HookWidget {
  const LoadingAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = useAnimationController(
      duration: const Duration(seconds: 3),
    )..repeat();
    return AnimatedBuilder(
      builder: (context, child) {
        return CircularProgressIndicator.adaptive(
          backgroundColor: Colors.white,
          valueColor: const AlwaysStoppedAnimation<Color>(
            Colors.blue,
          ),
          value: controller.value,
        );
      },
      animation: controller,
    );
  }
}
