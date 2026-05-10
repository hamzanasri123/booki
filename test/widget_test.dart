import 'package:booki/app/app.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('shows splash screen', (tester) async {
    await tester.pumpWidget(const ProviderScope(child: BookiApp()));

    expect(find.text('Booki'), findsOneWidget);
    expect(
      find.text('Réservation simple pour commerces de services.'),
      findsOneWidget,
    );
  });
}
