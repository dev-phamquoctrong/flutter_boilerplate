import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('MainHomeView test', () {
    testWidgets('Find a BottomNavigationBar widget', (widgetTester) async {
      await widgetTester.pumpWidget(
        const Application(),
      );
      await widgetTester.pumpAndSettle();
      final bottomNav = find.byType(BottomNavigationBar);
      expect(bottomNav, findsOneWidget);
    });
  });
}
