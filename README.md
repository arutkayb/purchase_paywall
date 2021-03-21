# PayWall Design

Subscription and Payment pages are important to drive people to purchase. There are different types of designs out there, also Apple has a guideline for us to implement a good Payment page. 
https://developer.apple.com/design/human-interface-guidelines/subscriptions/overview/

PayWall classes does not provide any functionality for purchase operations. You have to implement the purchase and pass the necessary callback functions to the desired PayWall class to make use of it.

# PurchasePaywall Package
PurchasePaywall is providing different types of PayWalls to satisfy different purchase types and design needs.

## PayWall Factory
Import the main file for the factory class
```
import 'package:purchase_paywall/purchase_paywall.dart';
```
You can customize the PayWall page by using ThemeData. Customizable parts are:
* Font by textTheme.fontFamily
* Background color by themeData.backgroundColor
* Foreground color by themeData.accentColor
* ...

Customization details may be different for each PayWall class. Check the specific PayWall for further details.

``` 
ThemeData themeData = ThemeData.from(
      colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.yellow),
      textTheme: GoogleFonts.pangolinTextTheme(
        Theme.of(context).textTheme,
      ),
    );
 
...
...
...
    
PurchasePayWall purchasePayWall = PurchasePayWall(
      theme: themeData,
    )

...
...

```

### SimpleWall
Design mockups:

![image](https://user-images.githubusercontent.com/22365448/111912660-af348f80-8a7b-11eb-894c-f24b25d25110.png)


Implementation:

![purchase_paywall](https://user-images.githubusercontent.com/22365448/111911828-19e3cc00-8a78-11eb-9dc9-ae34097b3fcd.gif)

Import necessary model classes
```
import 'package:purchase_paywall/model/basic_wall_model.dart';
import 'package:purchase_paywall/model/purchase_button_model.dart';
import 'package:purchase_paywall/model/wall_description.dart';
```

Create the SimpleWall by using the factory method. The necessary part is purchase item callbacks, do not pass the necessary functions to initiate payment operation.
```
List<PurchaseButtonModel> purchaseButtons = List()
    ..add(PurchaseButtonModel(
      text: '\$4.99 / Month',
      onPressed: PAYMENT_MONTHLY,
    ))
    ..add(PurchaseButtonModel(
      text: '\$23.99 / 6 Months',
      disclaimer: '(6 Months at 3.99/mo. Save 20%)',
      onPressed: PAYMENT_SIX_MONTH,
      bestOfferIndicator: true,
    ))
    ..add(PurchaseButtonModel(
      text: '\$29.99  / Year',
      disclaimer: '(12 Months at 2.49/mo. Save 50%)',
      onPressed: PAYMENT_ANNUAL,
    ));
```

Here is the example implementation that shows only a snackbar when a button tapped.

```
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

purchasePayWall.getSimplePayWall(
  BasicWallModel(
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
    autoPlayShowDuration: Duration(seconds: 2),
  ));
```

You can also remove the back arrow by using "bool showBackIcon" value and you can override back icon tapped behavior by using "Function backIconTapped" value in BasicWallModel.

Lastly, you can use the SimpleWall Widget any way you want such as navigating to it as a new page.
If you have a problem with Navigation, check your context if it is the right one. Here in my example the tricky part is a need for a Builder:

```
Builder(
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
)
```
#### Customization
* themeData.backgroundColor for background color
* themeData.accentColor for the rounded foreground color
* themeData.accentColor for PageView dot indicator selectedDotColor
* themeData.accentColor for PageView dot indicator borderColor
* themeData.primaryColor for PageView dot indicator dotColor
* themeData.textTheme.headline1.fontFamily for big title
* themeData.textTheme.subtitle1.fontFamily for WallDescription.title
* themeData.textTheme.bodyText1.fontFamily for WallDescription.description
* themeData.textTheme.bodyText2.fontFamily for trial indicator text
* themeData.textTheme.button.fontFamily for button text
* themeData.textTheme.bodyText2.fontFamily for button sub-info disclaimer text
* themeData.textTheme.bodyText2.fontFamily for bottom info


# Future of PurchasePaywall
I started with a simple design. I will add more classes to be used via the factory method. Please leave your comments and request designs to support the creation process.
