import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';
import 'package:purchase_paywall/model/basic_wall_model.dart';
import 'package:purchase_paywall/model/wall_description.dart';
import 'package:url_launcher/url_launcher.dart';

class SimpleWall extends StatefulWidget {
  final BasicWallModel _basicWallModel;
  final ThemeData _themeData;

  SimpleWall(this._basicWallModel, ThemeData theme) : this._themeData = theme;

  @override
  _SimpleWallState createState() => _SimpleWallState();
}

class _SimpleWallState extends State<SimpleWall> {
  final _currentPageNotifier = ValueNotifier<int>(0);
  Color _primaryForegroundColor;
  Color _accentForeGroundColor;

  @override
  void initState() {
    _primaryForegroundColor =
        widget._themeData.backgroundColor.computeLuminance() > 0.5
            ? Colors.black
            : Colors.white;

    _accentForeGroundColor =
        widget._themeData.accentColor.computeLuminance() > 0.5
            ? Colors.black
            : Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget._themeData.backgroundColor,
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Icon(
                      Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back,
                      color: _primaryForegroundColor,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.fromLTRB(15, 10, 15, 15),
                  margin: EdgeInsets.fromLTRB(10, 5, 10, 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: widget._themeData.accentColor,
                  ),
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
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
                          margin: EdgeInsets.fromLTRB(0, 15, 0, 5),
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
                      Container(
                        padding: EdgeInsets.all(5),
                        width: double.maxFinite,
                        color: Colors.purpleAccent,
                        child: getTrialIndicator(),
                      ),
                      Flexible(
                        flex: 3,
                        child: Container(
                          color: Colors.green,
                          child: getPurchaseButtons(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(5),
                width: double.maxFinite,
                constraints: BoxConstraints(
                  minHeight: 80,
                  maxHeight: 100,
                ),
                child: getBottomInfo(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getImage() {
    return FittedBox(
      fit: BoxFit.cover,
      child: widget._basicWallModel.image,
    );
  }

  Widget getPurchaseDescriptionTabs() {
    final PageController wallDescriptionController =
        PageController(initialPage: 0);

    List<Widget> pages = List();
    for (WallDescription wallDescription
        in widget._basicWallModel.wallDescriptions) {
      pages.add(
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FittedBox(
              fit: BoxFit.cover,
              child: Text(
                wallDescription.title,
                textAlign: TextAlign.center,
                maxLines: 1,
                style: TextStyle(
                  fontSize: 26,
                  color: _accentForeGroundColor,
                ),
              ),
            ),
            wallDescription.description == null
                ? Container()
                : Expanded(
                    child: Center(
                      child: Text(
                        wallDescription.description,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          color: _accentForeGroundColor,
                        ),
                      ),
                    ),
                  ),
          ],
        ),
      );
    }

    return Column(
      children: [
        Expanded(
          child: PageView(
            scrollDirection: Axis.horizontal,
            controller: wallDescriptionController,
            children: pages,
            onPageChanged: (int index) {
              _currentPageNotifier.value = index;
            },
          ),
        ),
        CirclePageIndicator(
          dotColor: widget._themeData.primaryColor,
          selectedDotColor: _accentForeGroundColor,
          borderColor: _accentForeGroundColor,
          borderWidth: 2,
          itemCount: pages.length,
          currentPageNotifier: _currentPageNotifier,
        ),
      ],
    );
  }

  Widget getTrialIndicator() {
    return Text(
      widget._basicWallModel.trialIndicator,
      textAlign: TextAlign.center,
    );
  }

  Widget getPurchaseButtons() {
    return Container();
  }

  Widget getBigTitle() {
    return Center(
      child: FittedBox(
        child: Text(
          widget._basicWallModel.bigTitle,
          textAlign: TextAlign.center,
          maxLines: 1,
          style: TextStyle(
            fontSize: 42,
            color: _accentForeGroundColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget getBottomInfo() {
    Color textColor = widget._themeData.backgroundColor.computeLuminance() > 0.5
        ? Colors.black
        : Colors.white;

    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            GestureDetector(
              onTap: () async {
                String url = widget._basicWallModel.privacyPolicyUrl;
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Cannot launch url';
                }
              },
              child: Text(
                widget._basicWallModel.privacyPolicyText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: textColor,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            GestureDetector(
              onTap: () async {
                String url = widget._basicWallModel.termsOfUseUrl;
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Cannot launch url';
                }
              },
              child: Text(
                widget._basicWallModel.termsOfUseText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: textColor,
                  decoration: TextDecoration.underline,
                ),
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
              widget._basicWallModel.bottomInfo,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: textColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
