import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:purchase_paywall/model/basic_wall_model.dart';
import 'package:purchase_paywall/model/purchase_button_model.dart';
import 'package:purchase_paywall/model/wall_description.dart';
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
      home: getSimpleWall(context),
    );
  }

  Widget getSimpleWall(BuildContext context) {
    String bigTitle = 'Get Premium Membership';
    List<WallDescription> wallDescriptions = List()
      ..add(
        WallDescription(
            title: 'Ad-Free Experience',
            description:
                'Do not let us earn money, Ad-Free Experience is the best.'),
      )
      ..add(
        WallDescription(
          title: 'Unlimited Access',
          description: 'All the premium features are free for your usage.',
        ),
      )
      ..add(
        WallDescription(
          title: 'Customizable Screen',
          description:
              'Reveal your creativity by customizing all the screens according to your preferences.',
        ),
      );
    String trialIndicator = 'Start with 1 week free trial';
    String privacyPolicyText = 'Privacy Policy';
    String privacyPolicyUrl = 'https://en.wikipedia.org/wiki/Privacy_policy';
    String termsOfUseText = 'Terms of Use';
    String termsOfUseUrl = 'https://en.wikipedia.org/wiki/Terms_of_service';
    String bottomInfo =
        'Payments are charged to the user’s Apple ID account at confirmation of purchase. Subscriptions automatically renew unless the user cancels at least 24 hours before the end of the current period. The account is charged for renewal within 24-hours before the end of the current period. Users can manage and cancel subscriptions in their account settings on the App Store.';
    List<PurchaseButtonModel> purchaseButtons = List()
      ..add(PurchaseButtonModel(
        text: '\$4.99 / Month',
        onPressed: () => {},
      ))
      ..add(PurchaseButtonModel(
        text: '\$23.99 / 6 Months',
        disclaimer: '(6 Months at 3.99/mo. Save 20%)',
        onPressed: () => {},
        bestOfferIndicator: true,
      ))
      ..add(PurchaseButtonModel(
        text: '\$29.99  / Year',
        disclaimer: '(12 Months at 2.49/mo. Save 50%)',
        onPressed: () => {},
      ));

    Image image = Image.network(
        'https://cdn0.iconfinder.com/data/icons/shopping-icons-part-1/512/shopping-12-512.png');

    ThemeData themeData = ThemeData.from(
      colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.yellow),
      textTheme: GoogleFonts.pangolinTextTheme(
        Theme.of(context).textTheme,
      ),
    );

    return PurchasePayWall(
      theme: themeData,
    ).getSimplePaywall(BasicWallModel(
      bigTitle: bigTitle,
      wallDescriptions: wallDescriptions,
      trialIndicator: trialIndicator,
      privacyPolicyText: privacyPolicyText,
      privacyPolicyUrl: privacyPolicyUrl,
      termsOfUseText: termsOfUseText,
      termsOfUseUrl: termsOfUseUrl,
      bottomInfo: bottomInfo,
      purchaseButtons: purchaseButtons,
      image: image,
    ));
  }
}
