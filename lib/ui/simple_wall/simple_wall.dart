import 'package:flutter/widgets.dart';
import 'package:purchase_paywall/model/basic_wall_model.dart';

class SimpleWall extends StatefulWidget {
  final BasicWallModel _basicWallModel;

  SimpleWall(this._basicWallModel);

  @override
  _SimpleWallState createState() => _SimpleWallState();
}

class _SimpleWallState extends State<SimpleWall> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
