import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/gen/assets.gen.dart';

import '../../constants/app_strings.dart';
import '../../constants/app_text_styles.dart';

class NotFoundDataView extends StatelessWidget {
  const NotFoundDataView({
    super.key,
    this.textColor,
  });

  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Assets.images.pngs.box.image(
            width: 50.0,
            height: 50.0,
          ),
          const SizedBox(
            height: 10.0,
          ),
          const Text(
            AppStrings.kNotFoundData,
            style: AppTextStyles.highlight,
          ),
        ],
      ),
    );
  }
}
