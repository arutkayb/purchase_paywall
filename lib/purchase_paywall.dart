library purchase_paywall;

import 'package:purchase_paywall/di/injector.dart';
import 'package:purchase_paywall/model/basic_wall_model.dart';
import 'package:purchase_paywall/ui/paywall_factory.dart';
import 'package:purchase_paywall/ui/simple_wall/simple_wall.dart';

class PurchasePayWall {
  PaywallFactory _paywallFactory;
  PurchasePayWall() {
    final injector = DependencyManager().injector;

    _paywallFactory = injector.get<PaywallFactory>();
  }

  SimpleWall getSimplePaywall(BasicWallModel basicWallModel) =>
      _paywallFactory.getSimpleWall(basicWallModel);
}
