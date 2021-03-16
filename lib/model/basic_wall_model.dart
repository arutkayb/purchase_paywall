import 'package:purchase_paywall/model/purchase_button_model.dart';

class BasicWallModel {
  final String bigTitle;
  final String subTitle;
  final String trialIndicator;
  final String privacyPolicyText;
  final String privacyPolicyUrl;
  final String termsOfUseText;
  final String termsOfUseUrl;
  final String bottomInfo;
  final List<PurchaseButtonModel> purchaseButtons;

  BasicWallModel({
    this.bigTitle,
    this.subTitle,
    this.trialIndicator,
    this.privacyPolicyText,
    this.privacyPolicyUrl,
    this.termsOfUseText,
    this.termsOfUseUrl,
    this.bottomInfo,
    this.purchaseButtons,
  });
}
