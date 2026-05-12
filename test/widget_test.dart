import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:andesgrow_mobile/main.dart';

void main() {
  testWidgets('AndesGrow app loads correctly', (WidgetTester tester) async {
    await tester.pumpWidget(const AndesGrowApp());

    expect(find.text('AndesGrow'), findsOneWidget);
    expect(find.byIcon(Icons.dashboard), findsOneWidget);
  });
}
