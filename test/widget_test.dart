import 'package:flutter_test/flutter_test.dart';
import 'package:golden_xi/main.dart';

void main() {
  testWidgets('Golden XI Splash Screen test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const GoldenXiApp());

    // Verify that the splash screen shows the Golden XI title.
    expect(find.text('GOLDEN XI'), findsOneWidget);
    expect(find.text('XI'), findsOneWidget);
  });
}
