import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:qatar2022/components/default_button.dart';

import 'package:qatar2022/screens/splash/splash_screen.dart';

import 'test_material_app.dart';
import 'test_navigator_observer.dart';

void main() {
  SplashScreen homePage;
  TestNavigatorObserver _navObserver;

  Widget _homeWidget() {
    return TestMaterialAppWidget(
      home: homePage,
      navigatorObserver: _navObserver,
    );
  }

  setUp(() {
    homePage = SplashScreen();
    _navObserver = TestNavigatorObserver();
  });

  testWidgets("Splash screen loaded", (WidgetTester tester) async {
    //  given

    //  when
    await tester.pumpWidget(_homeWidget());

    //  then
    expect(find.byType(SplashScreen), findsOneWidget);
  });

  testWidgets("Next screen text shown", (WidgetTester tester) async {
    //  given

    //  when
    await tester.pumpWidget(_homeWidget());

    //  then
    expect(find.byType(SplashScreen), findsOneWidget);
  });

  testWidgets('DefaultButton has proper title', (WidgetTester tester) async {
    //  given
    await tester.pumpWidget(_homeWidget());

    //  when
    final button = tester.widget<DefaultButton>(find.byType(DefaultButton));

    //  then
    expect(button.text, 'Continuer');
  });
}
