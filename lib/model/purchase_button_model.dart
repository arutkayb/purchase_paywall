import 'package:flutter/widgets.dart';

class PurchaseButtonModel {
  final String text;
  final Function onPressed;
  final bool bestOfferIndicator;

  PurchaseButtonModel({
    @required this.text,
    @required this.onPressed,
    bool bestOfferIndicator,
  }) : this.bestOfferIndicator = bestOfferIndicator ?? false;
}
