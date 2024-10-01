import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/presentation/ui/widgets/app_bar_view.dart';

import '../../../constants/app_strings.dart';
import '../../../constants/app_text_styles.dart';

class UserDetailScreen extends StatelessWidget {
  const UserDetailScreen({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarView(
        title: AppStrings.kUserDetail,
      ),
      body: Center(
        child: Text(
          text,
          style: AppTextStyles.highlight,
        ),
      ),
    );
  }
}
