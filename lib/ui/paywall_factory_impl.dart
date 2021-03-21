import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:purchase_paywall/model/basic_wall_model.dart';
import 'package:purchase_paywall/ui/paywall_factory.dart';
import 'package:purchase_paywall/ui/simple_wall/simple_wall.dart';

class PayWallFactoryImpl implements PayWallFactory {
  ThemeData _theme;

  PayWallFactoryImpl() {
    _theme = ThemeData.from(
      colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.yellow),
    );
  }

  @override
  void setTheme(ThemeData theme) {
    if (theme != null) this._theme = theme;
  }

  @override
  Widget getSimpleWall(BasicWallModel basicWallModel) {
    return SimpleWall(basicWallModel, _theme);
  }
}
