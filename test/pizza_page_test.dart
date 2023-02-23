import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pizza_bloc_app/screens/pizza_page.dart';

void main() {
  group('Pizza Bloc test', () {

  });
  testWidgets('Pizza page smoke test', (WidgetTester tester) async {
    // Build widget to test for
    await tester.pumpWidget(const MaterialApp(
      home: PizzaPage(),
    ));

    // Test the widget built
    expect(find.text('0'), findsOneWidget);
    expect(find.byIcon(Icons.local_pizza_outlined), findsOneWidget);
    expect(find.text('-'), findsOneWidget);
    expect(find.byIcon(Icons.local_pizza), findsOneWidget);
    expect(find.text('-'), findsOneWidget);

    // testing when buttons are pressed
    // entering values to text filed.

    await tester.enterText(find.byKey(const ValueKey('firstOperand')), '10');

    await tester.enterText(find.byKey(const ValueKey('secondOperand')), '10');

    await tester.tap(find.text('+'));
    await tester.pump();
    expect(find.text('20.0'), findsOneWidget);

    await tester.tap(find.text('-'));
    await tester.pump();
    expect(find.text('0.0'), findsOneWidget);
  });
}