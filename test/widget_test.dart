import 'package:flutter_test/flutter_test.dart';
import 'package:el_sueno_comunista/app/app.dart';

void main() {
  testWidgets('App should build without errors', (WidgetTester tester) async {
    await tester.pumpWidget(const App());
    expect(find.byType(App), findsOneWidget);
  });
}
