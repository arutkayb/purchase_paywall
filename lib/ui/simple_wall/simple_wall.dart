import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:purchase_paywall/model/basic_wall_model.dart';

class SimpleWall extends StatelessWidget {
  final BasicWallModel _basicWallModel;
  SimpleWall(this._basicWallModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: Container(
          child: Container(
            child: Column(
              children: <Widget>[
                Flexible(
                  child: getBigTitle(),
                ),
                Flexible(
                    child: Image.network(
                        'https://aws1.discourse-cdn.com/mcneel/uploads/default/optimized/3X/8/4/8403f58a4af8c97f635586223454a6f29e9fc1dc_2_500x500.png')),
                Flexible(
                  child: getPurchaseDescriptionTabs(),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Divider(
                    color: Colors.black,
                    thickness: 0.5,
                  ),
                ),
                Flexible(
                  child: getPurchaseButtons(),
                ),
                Flexible(
                  child: Container(
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget getPurchaseDescriptionTabs() {
    return Container(
      color: Colors.yellow,
      child: Column(
        children: <Widget>[
          Center(
            child: getSubTitle(),
          ),
          getDescription(),
        ],
      ),
    );
  }

  Widget getPurchaseButtons() {
    return Container(
      color: Colors.green,
    );
  }

  Widget getBigTitle() {
    return Container(
      child: Center(
        child: Text(
          _basicWallModel.bigTitle,
          textAlign: TextAlign.center,
        ),
      ),
      color: Colors.purple,
    );
  }

  Widget getSubTitle() {
    return FittedBox(
      fit: BoxFit.cover,
      child: Text(
        _basicWallModel.wallDescriptions[0].subtitle,
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget getDescription() {
    return Container(
      width: double.maxFinite,
      child: Text(
        _basicWallModel.wallDescriptions[0].title,
        textAlign: TextAlign.center,
      ),
      color: Colors.greenAccent,
    );
  }
}
