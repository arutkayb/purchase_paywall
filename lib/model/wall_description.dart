import 'package:flutter/cupertino.dart';

class WallDescription {
  final String _title;
  final String _description;

  WallDescription({
    @required String title,
    @required String description,
  })  : _title = title,
        _description = description;

  String get subtitle => _description;

  String get title => _title;
}
