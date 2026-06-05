import 'package:flutter_test/flutter_test.dart';
import 'package:pubpub/app.dart';

void main() {
  testWidgets('App should render without errors', (WidgetTester tester) async {
    await tester.pumpWidget(const PubPubApp());
    await tester.pumpAndSettle();

    // Verify that the app renders
    expect(find.text('搜索'), findsOneWidget);
  });
}
