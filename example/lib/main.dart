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
    ThemeData themeData = ThemeData.from(
      colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.yellow),
      textTheme: GoogleFonts.pangolinTextTheme(
        Theme.of(context).textTheme,
      ),
    );

    return MaterialApp(
      title: 'Flutter Demo',
      theme: themeData,
      home: Scaffold(
        body: Center(
          child: Builder(
            builder: (BuildContext context) {
              return ElevatedButton(
                onPressed: () => navigateToShop(context, themeData),
                child: Text(
                  'Go to Shop',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void navigateToShop(BuildContext context, ThemeData themeData) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => getShopPage(context, themeData),
      ),
    );
  }

  Widget getShopPage(BuildContext context, ThemeData themeData) {
    String bigTitle = 'Get Premium Membership';

    Image image = Image.network(
        'https://cdn0.iconfinder.com/data/icons/shopping-icons-part-1/512/shopping-12-512.png');

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

    List<PurchaseButtonModel> purchaseButtons = List()
      ..add(PurchaseButtonModel(
        text: '\$4.99 / Month',
        onPressed: () => showSnackBarWithText(context, 'Enjoy for a month!'),
      ))
      ..add(PurchaseButtonModel(
        text: '\$23.99 / 6 Months',
        disclaimer: '(6 Months at 3.99/mo. Save 20%)',
        onPressed: () => showSnackBarWithText(context, 'Enjoy for 6 months!'),
        bestOfferIndicator: true,
      ))
      ..add(PurchaseButtonModel(
        text: '\$29.99  / Year',
        disclaimer: '(12 Months at 2.49/mo. Save 50%)',
        onPressed: () => showSnackBarWithText(context, 'Enjoy for 12 months!'),
      ));

    String privacyPolicyText = 'Privacy Policy';

    String privacyPolicyUrl = 'https://en.wikipedia.org/wiki/Privacy_policy';

    String termsOfUseText = 'Terms of Use';

    String termsOfUseUrl = 'https://en.wikipedia.org/wiki/Terms_of_service';

    String bottomInfo =
        'Payments are charged to the user’s Apple ID account at confirmation of purchase. Subscriptions automatically renew unless the user cancels at least 24 hours before the end of the current period. The account is charged for renewal within 24-hours before the end of the current period. Users can manage and cancel subscriptions in their account settings on the App Store.';

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

  void showSnackBarWithText(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          text,
          textAlign: TextAlign.center,
        ),
        duration: Duration(seconds: 1),
      ),
    );
  }
}
