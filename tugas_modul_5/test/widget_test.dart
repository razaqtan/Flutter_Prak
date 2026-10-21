// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:tugas_modul_5/main.dart';

void main() {
  testWidgets('shows the now-playing card and toggles like', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Sedang memutar'), findsOneWidget);
    expect(find.text('Midnight City'), findsOneWidget);
    expect(find.text('M83'), findsOneWidget);
    expect(Theme.of(tester.element(find.text('Sedang memutar'))).brightness,
        Brightness.dark);

    final card = tester.widget<Card>(find.byType(Card));
    expect(card.elevation, 4);
    expect(card.shape, isA<RoundedRectangleBorder>());

    expect(find.byIcon(Icons.favorite_border), findsOneWidget);
    await tester.tap(find.byIcon(Icons.favorite_border));
    await tester.pump();

    expect(find.byIcon(Icons.favorite), findsOneWidget);
  });
}
