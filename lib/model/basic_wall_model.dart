import 'package:flutter/cupertino.dart';
import 'package:purchase_paywall/model/purchase_button_model.dart';
import 'package:purchase_paywall/model/wall_description.dart';

class BasicWallModel {
  final String bigTitle;
  final List<WallDescription> wallDescriptions;
  final String trialIndicator;
  final String privacyPolicyText;
  final String privacyPolicyUrl;
  final String termsOfUseText;
  final String termsOfUseUrl;
  final String bottomInfo;
  final List<PurchaseButtonModel> purchaseButtons;
  final Image image;
  final bool showBackIcon;
  final Function backIconTapped;
  final Duration autoPlayShowDuration;

  BasicWallModel({
    this.bigTitle,
    this.wallDescriptions,
    this.trialIndicator,
    this.privacyPolicyText,
    this.privacyPolicyUrl,
    this.termsOfUseText,
    this.termsOfUseUrl,
    this.bottomInfo,
    this.purchaseButtons,
    this.image,
    this.backIconTapped,
    this.showBackIcon,
    this.autoPlayShowDuration,
  });
}
