import 'package:flutter_test/flutter_test.dart';
import 'package:cubit_learn_1/main.dart';
import 'package:cubit_learn_1/presentation/router/app_router.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

void main() {
  testWidgets('MyApp widget test', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp(
      appRouter: AppRouter(),
      connectivity: Connectivity(),
    ));

    expect(find.byType(MaterialApp), findsOneWidget);
  });
}