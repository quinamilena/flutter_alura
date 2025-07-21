import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_unit_tests/data/bank_inherited.dart';
import 'package:flutter_unit_tests/screens/home.dart';

void main() {
  testWidgets('My widget has a text "Spent"', (tester) async {
    await tester.pumpWidget(MaterialApp(home: BankInherited(child: Home())));

    final spentFinal = find.text('Spent');

    expect(spentFinal, findsOneWidget);
  });

  testWidgets('Finds a LinearProgressIndicator', (tester) async {
    await tester.pumpWidget(MaterialApp(home: BankInherited(child: Home())));

    expect(find.byType(LinearProgressIndicator), findsOneWidget);
  });

  testWidgets('Finds a AccountStatus', (tester) async {
    await tester.pumpWidget(MaterialApp(home: BankInherited(child: Home())));

    expect(find.byKey(Key('testKey')), findsOneWidget);
  });

  testWidgets('My widget has a text "Deposit" ', (tester) async {
    await tester.pumpWidget(MaterialApp(home: BankInherited(child: Home())));
    final spentFinder = find.text('Deposit');
    expect(spentFinder, findsOneWidget);
  });

  testWidgets('When tap Deposit should upload earned in 10', (tester) async {
    await tester.pumpWidget(MaterialApp(home: BankInherited(child: Home())));
    await tester.tap(find.text('Deposit'));
    await tester.tap(find.text('Earned'));

    //Atualizar a widget para pesquisar na widget após o teste
    await tester.pumpAndSettle();

    expect(find.text('\$10.0'), findsOneWidget);
  });
}
