import 'package:flutter/material.dart';
import 'package:purchase_paywall/model/basic_wall_model.dart';
import 'package:purchase_paywall/purchase_paywall.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: PurchasePayWall().getSimplePaywall(BasicWallModel()),
    );
  }
}