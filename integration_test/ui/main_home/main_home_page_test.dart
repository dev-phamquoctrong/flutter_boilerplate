import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(
    'MainHomePage test',
    () {
      testWidgets(
        'Bottom navigation bar test',
        (widgetTester) async {
          await widgetTester.pumpWidget(const Application());
          final bottomNav = find.byType(BottomNavigationBar);
          expect(bottomNav, findsOneWidget);

          final homeTab = find.byIcon(Icons.home);
          final personTab = find.byIcon(Icons.person);
          expect(homeTab, findsOneWidget);
          expect(personTab, findsOneWidget);
        },
      );
    },
  );
}
