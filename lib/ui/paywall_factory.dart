import 'package:flutter/widgets.dart';
import 'package:purchase_paywall/model/basic_wall_model.dart';

abstract class PaywallFactory {
  Widget getSimpleWall(BasicWallModel basicWallModel);
}
