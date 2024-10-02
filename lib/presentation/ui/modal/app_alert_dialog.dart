import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../gen/colors.gen.dart';
import '../../constants/app_strings.dart';

class AppAlertDialog extends StatelessWidget {
  const AppAlertDialog({
    super.key,
    this.message,
  });

  final String? message;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      title: const Text(
        AppStrings.kError,
        style: TextStyle(
          color: ColorName.black6f,
        ),
      ),
      content: Text(
        message ?? AppStrings.kUnknown,
        style: const TextStyle(
          color: ColorName.black6f,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            context.pop();
          },
          child: const Text(
            AppStrings.kClose,
            style: TextStyle(
              color: ColorName.black6f,
            ),
          ),
        ),
      ],
    );
  }
}
