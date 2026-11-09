
import 'package:flutter_test/flutter_test.dart';
import 'package:lab_04/main.dart';

void main() {
  testWidgets('Menu displays all three items',
      (WidgetTester tester) async {
    await tester.pumpWidget(const PizzaStoreApp());

    expect(find.text('Pepperoni Pizza'), findsOneWidget);
    expect(find.text('Margherita Pizza'), findsOneWidget);
    expect(find.text('Box of Fries'), findsOneWidget);
  });

  testWidgets('Tapping Pepperoni opens detail screen',
      (WidgetTester tester) async {
    await tester.pumpWidget(const PizzaStoreApp());

    await tester.tap(find.text('Pepperoni Pizza'));
    await tester.pumpAndSettle();

    expect(find.text('Back to Menu'), findsOneWidget);
    expect(
      find.textContaining('Delicious pizza with pepperoni'),
      findsOneWidget,
    );
  });

  testWidgets('Back button returns to menu',
      (WidgetTester tester) async {
    await tester.pumpWidget(const PizzaStoreApp());

    await tester.tap(find.text('Margherita Pizza'));
    await tester.pumpAndSettle();

    expect(find.text('Back to Menu'), findsOneWidget);

    await tester.tap(find.text('Back to Menu'));
    await tester.pumpAndSettle();

    expect(find.text('Pizza Store Menu'), findsOneWidget);
    expect(find.text('Box of Fries'), findsOneWidget);
  });
}
