import 'package:flutter/widgets.dart';
import 'package:purchase_paywall/model/basic_wall_model.dart';
import 'package:purchase_paywall/ui/paywall_factory.dart';
import 'package:purchase_paywall/ui/simple_wall/simple_wall.dart';

class PaywallFactoryImpl implements PaywallFactory{
  @override
  Widget getSimpleWall(BasicWallModel basicWallModel) {
    return SimpleWall(basicWallModel);
  }
}