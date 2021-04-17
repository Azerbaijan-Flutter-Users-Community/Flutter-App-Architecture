import 'package:architecture_example/presentation/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Simple Test', (tester) async {
    await tester.pumpWidget(App());
    await tester.pumpAndSettle();

    final appbarFinder = find.byType(AppBar);
    expect(appbarFinder, findsOneWidget);
  });
}
