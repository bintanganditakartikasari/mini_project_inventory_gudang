import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mini_project_inventory_gudang/screen/home_screen.dart';

void main() {
  testWidgets('HomeScreen Test', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: HomeScreen(),
      ),
    );
    expect(find.text('Inventory Gudang'), findsOneWidget);
    expect(find.byIcon(Icons.brightness_6), findsOneWidget);
    expect(find.text('Pabrik Ajinomoto'), findsOneWidget);
  });
}