import 'package:flutter/widgets.dart';

class PurchaseButtonModel {
  final String text;
  final String disclaimer;
  final Function onPressed;
  final bool bestOfferIndicator;

  PurchaseButtonModel({
    @required this.text,
    this.disclaimer,
    @required this.onPressed,
    bool bestOfferIndicator,
  }) : this.bestOfferIndicator = bestOfferIndicator ?? false;
}
