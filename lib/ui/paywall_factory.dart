import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:purchase_paywall/model/basic_wall_model.dart';

abstract class PaywallFactory {
  void setTheme(ThemeData theme);
  Widget getSimpleWall(BasicWallModel basicWallModel);
}
