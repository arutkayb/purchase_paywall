library purchase_paywall;

import 'package:flutter/material.dart';
import 'package:purchase_paywall/di/injector.dart';
import 'package:purchase_paywall/model/basic_wall_model.dart';
import 'package:purchase_paywall/ui/paywall_factory.dart';
import 'package:purchase_paywall/ui/simple_wall/simple_wall.dart';

class PurchasePayWall {
  PayWallFactory _payWallFactory;
  PurchasePayWall({ThemeData theme}) {
    final injector = DependencyManager().injector;

    _payWallFactory = injector.get<PayWallFactory>();
    _payWallFactory.setTheme(theme);
  }

  SimpleWall getSimplePayWall(BasicWallModel basicWallModel) =>
      _payWallFactory.getSimpleWall(basicWallModel);
}
