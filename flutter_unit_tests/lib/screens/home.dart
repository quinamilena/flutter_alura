import 'package:flutter/material.dart';
import 'package:flutter_unit_tests/components/sections/actions.dart';
import 'package:flutter_unit_tests/components/sections/header.dart';
import 'package:flutter_unit_tests/components/sections/points_exchange.dart';
import 'package:flutter_unit_tests/components/sections/recent_activities.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: const <Widget>[
            Header(), // cuidado com o const
            RecentActivity(),
            ActionsSection(),
            PointsExchange(),
          ],
        ),
      ),
    );
  }
}
