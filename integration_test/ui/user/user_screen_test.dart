import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/main.dart';
import 'package:flutter_boilerplate/presentation/ui/user/view/user_detail_screen.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Test [UserScreen]', () {
    testWidgets('Test listview', (widgetTester) async {
      await widgetTester.pumpWidget(const Application());
      // Verify Loading indicator is present
      final loadingProgress = find.byType(CircularProgressIndicator);
      expect(loadingProgress, findsOneWidget);
      await widgetTester.pumpAndSettle();
      // Verify Loading indicator is disable
      expect(loadingProgress, findsNothing);
      // Verify list of user is present.
      final userListView = find.byType(ListView);
      expect(userListView, findsOneWidget);

      await widgetTester.dragUntilVisible(
        find.text('12 Angry Men'), // what you want to find
        find.byType(ListView), // widget you want to scroll
        const Offset(-250, 0), // delta to move
      );

      // Verify first item of list of user.
      final firstUserItem = find.text('Michael');
      expect(firstUserItem, findsOneWidget);

      final detailUserScreen = find.byType(UserDetailScreen);

      expect(detailUserScreen, findsNothing);

      // Click on item.
      await widgetTester.tap(firstUserItem);
      await widgetTester.pumpAndSettle();

      // Verify detail user opened or not when click on item.
      expect(detailUserScreen, findsOneWidget);
    });
  });
}
