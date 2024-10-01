import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/presentation/theme/theme_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeSettingScreen extends ConsumerWidget {
  const ThemeSettingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(themeProvider.notifier);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {
                controller.setDarkMode();
              },
              child: const Text(
                'Set dark mode',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                controller.setLightMode();
              },
              child: const Text(
                'Set light mode',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                controller.setSystemMode();
              },
              child: const Text(
                'Set system mode',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
