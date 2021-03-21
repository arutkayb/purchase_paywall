import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:purchase_paywall/model/basic_wall_model.dart';
import 'package:url_launcher/url_launcher.dart';

class SimpleWall extends StatelessWidget {
  final BasicWallModel _basicWallModel;
  final ThemeData _themeData;
  SimpleWall(this._basicWallModel, ThemeData theme) : this._themeData = theme;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _themeData.backgroundColor,
      body: SafeArea(
        child: Container(
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  color: Colors.purple,
                  child: getBigTitle(),
                ),
                Flexible(
                  flex: 5,
                  child: Center(
                    child: getImage(),
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Container(
                    color: Colors.yellow,
                    child: getPurchaseDescriptionTabs(),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Divider(
                    color: Colors.black,
                    thickness: 0.5,
                  ),
                ),
                Flexible(
                  flex: 3,
                  child: Container(
                    color: Colors.green,
                    child: getPurchaseButtons(),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  width: double.maxFinite,
                  constraints: BoxConstraints(
                    minHeight: 80,
                    maxHeight: 100,
                  ),
                  color: Colors.black54,
                  child: getBottomInfo(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget getImage() {
    return FittedBox(
      fit: BoxFit.cover,
      child: _basicWallModel.image,
    );
  }

  Widget getPurchaseDescriptionTabs() {
    return Column(
      children: <Widget>[
        getSubTitle(),
        getDescription(),
      ],
    );
  }

  Widget getPurchaseButtons() {
    return Container();
  }

  Widget getBigTitle() {
    return Center(
      child: Text(
        _basicWallModel.bigTitle,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 42),
      ),
    );
  }

  Widget getSubTitle() {
    return FittedBox(
      fit: BoxFit.cover,
      child: Text(
        _basicWallModel.wallDescriptions[0].title,
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget getDescription() {
    return Container(
      width: double.maxFinite,
      child: Text(
        _basicWallModel.wallDescriptions[0].description,
        textAlign: TextAlign.center,
      ),
      color: Colors.greenAccent,
    );
  }

  Widget getBottomInfo() {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            GestureDetector(
              onTap: () async {
                String url = _basicWallModel.privacyPolicyUrl;
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Cannot launch url';
                }
              },
              child: Text(
                _basicWallModel.privacyPolicyText,
                textAlign: TextAlign.center,
              ),
            ),
            GestureDetector(
              onTap: () async {
                String url = _basicWallModel.termsOfUseUrl;
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Cannot launch url';
                }
              },
              child: Text(
                _basicWallModel.termsOfUseText,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Text(
              _basicWallModel.bottomInfo,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
