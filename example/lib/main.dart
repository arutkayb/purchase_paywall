import 'package:flutter/material.dart';
import 'package:purchase_paywall/model/basic_wall_model.dart';
import 'package:purchase_paywall/model/purchase_button_model.dart';
import 'package:purchase_paywall/purchase_paywall.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: getSimpleWall(),
    );
  }

  Widget getSimpleWall() {
    String bigTitle = 'Big Title';
    String subTitle = 'Sub Title';
    String trialIndicator = 'Start with a 1 week free trial.';
    String privacyPolicyText = 'Privacy Policy';
    String privacyPolicyUrl = '';
    String termsOfUseText = 'Terms of Use';
    String termsOfUseUrl = '';
    String bottomInfo =
        'Payments are charged to the user’s Apple ID account at confirmation of purchase. Subscriptions automatically renew unless the user cancels at least 24 hours before the end of the current period. The account is charged for renewal within 24-hours before the end of the current period. Users can manage and cancel subscriptions in their account settings on the App Store.';
    List<PurchaseButtonModel> purchaseButtons = List()
      ..add(PurchaseButtonModel(
        text: 'Weekly -> 2.99 USD',
        onPressed: () => {},
      ))
      ..add(PurchaseButtonModel(
        text: 'Monthly -> 3.99 USD',
        onPressed: () => {},
        bestOfferIndicator: true,
      ))
      ..add(PurchaseButtonModel(
        text: 'Yearly -> 4.99 USD',
        onPressed: () => {},
      ));

    return PurchasePayWall().getSimplePaywall(
      BasicWallModel(
        bigTitle: bigTitle,
        subTitle: subTitle,
        trialIndicator: trialIndicator,
        privacyPolicyText: privacyPolicyText,
        privacyPolicyUrl: privacyPolicyUrl,
        termsOfUseText: termsOfUseText,
        termsOfUseUrl: termsOfUseUrl,
        bottomInfo: bottomInfo,
        purchaseButtons: purchaseButtons,
      ),
    );
  }
}
