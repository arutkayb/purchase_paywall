import 'package:flutter/cupertino.dart';

class WallDescription {
  final String _title;
  final String _description;

  WallDescription({
    @required String title,
    String description,
  })  : _title = title,
        _description = description;

  String get description => _description;

  String get title => _title;
}
