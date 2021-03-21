import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:purchase_paywall/custom_widget/custom_page_view.dart';
import 'package:purchase_paywall/custom_widget/custom_widget_shaker.dart';
import 'package:purchase_paywall/model/basic_wall_model.dart';
import 'package:purchase_paywall/model/purchase_button_model.dart';
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
  Color _primaryForegroundColor;
  Color _accentForeGroundColor;

  @override
  void initState() {
    super.initState();

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
              widget._basicWallModel.showBackIcon ?? true
                  ? Align(
                      alignment: Alignment.topLeft,
                      child: GestureDetector(
                        onTap: widget._basicWallModel.backIconTapped != null
                            ? widget._basicWallModel.backIconTapped
                            : () => Navigator.pop(context),
                        child: Container(
                          margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                          child: Icon(
                            Platform.isIOS
                                ? Icons.arrow_back_ios
                                : Icons.arrow_back,
                            color: _primaryForegroundColor,
                          ),
                        ),
                      ),
                    )
                  : Container(),
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
                        flex: 4,
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
                        padding: EdgeInsets.all(5),
                        child: Divider(
                          color: Colors.black,
                          thickness: 1,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        width: double.maxFinite,
                        child: getTrialIndicator(),
                      ),
                      Flexible(
                        flex: 3,
                        child: getPurchaseButtons(),
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
      child: Container(
        constraints: BoxConstraints(minHeight: 1, minWidth: 1),
        child: widget._basicWallModel.image,
      ),
    );
  }

  Widget getPurchaseDescriptionTabs() {
    List<Widget> pages = List();
    for (WallDescription wallDescription
        in widget._basicWallModel.wallDescriptions) {
      pages.add(
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: Center(
                child: AutoSizeText(
                  wallDescription.title,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  maxFontSize: 28,
                  style: TextStyle(
                    fontFamily:
                        widget._themeData.textTheme.subtitle1.fontFamily,
                    fontSize: 28,
                    color: _accentForeGroundColor,
                  ),
                ),
              ),
            ),
            wallDescription.description == null
                ? Container()
                : Expanded(
                    child: Center(
                      child: AutoSizeText(
                        wallDescription.description,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily:
                              widget._themeData.textTheme.bodyText1.fontFamily,
                          fontSize: 20,
                          color: _accentForeGroundColor,
                        ),
                      ),
                    ),
                  ),
          ],
        ),
      );
    }

    return CustomPageView(
      dotColor: widget._themeData.primaryColor,
      selectedDotColor: _accentForeGroundColor,
      borderColor: _accentForeGroundColor,
      pages: pages,
      autoPlayShowDuration: widget._basicWallModel.autoPlayShowDuration,
    );
  }

  Widget getTrialIndicator() {
    return Text(
      widget._basicWallModel.trialIndicator,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: _accentForeGroundColor,
        fontFamily: widget._themeData.textTheme.bodyText2.fontFamily,
      ),
    );
  }

  Widget getPurchaseButtons() {
    List<Widget> buttons = List();

    for (PurchaseButtonModel purchaseButton
        in widget._basicWallModel.purchaseButtons) {
      Widget text = FittedBox(
        child: Text(
          purchaseButton.text,
          textAlign: TextAlign.center,
          maxLines: 1,
          style: TextStyle(
            fontFamily: widget._themeData.textTheme.button.fontFamily,
            fontSize: 24,
            color: _accentForeGroundColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      );

      Widget buttonContent = OutlinedButton(
        onPressed: purchaseButton.onPressed,
        child: text,
        style: OutlinedButton.styleFrom(
          primary: _accentForeGroundColor,
          side: BorderSide(
            width: 1.5,
            color: _accentForeGroundColor,
          ),
        ),
      );

      Widget button = purchaseButton.bestOfferIndicator
          ? CustomWidgetShaker(
              power: 1.5,
              child: buttonContent,
            )
          : Container(
              padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: buttonContent,
            );

      buttons.add(
        Flexible(
          child: Column(
            children: [
              Expanded(
                child: Container(
                  child: button,
                  width: double.maxFinite,
                ),
              ),
              Expanded(
                child: Text(
                  purchaseButton.disclaimer ?? ' ',
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  style: TextStyle(
                    fontFamily:
                        widget._themeData.textTheme.bodyText2.fontFamily,
                    fontSize: 14,
                    color: _accentForeGroundColor,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: buttons,
    );
  }

  Widget getBigTitle() {
    return Center(
      child: FittedBox(
        child: Text(
          widget._basicWallModel.bigTitle,
          textAlign: TextAlign.center,
          maxLines: 1,
          style: TextStyle(
            fontFamily: widget._themeData.textTheme.headline1.fontFamily,
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
                  fontFamily: widget._themeData.textTheme.bodyText2.fontFamily,
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
                  fontFamily: widget._themeData.textTheme.bodyText2.fontFamily,
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
                fontFamily: widget._themeData.textTheme.bodyText2.fontFamily,
                color: textColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
