import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/presentation/ui/widgets/loading_animation.dart';

class LoadingMask extends StatelessWidget {
  const LoadingMask({
    super.key,
    required this.child,
    this.isDisplayLoading = false,
  });

  final Widget child;
  final bool isDisplayLoading;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        Visibility(
          visible: isDisplayLoading,
          child: Material(
            color: Colors.black.withOpacity(0.8),
            child: const Center(
              child: LoadingAnimation(),
            ),
          ),
        ),
      ],
    );
  }
}
