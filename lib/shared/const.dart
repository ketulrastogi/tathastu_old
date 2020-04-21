import 'package:flutter/material.dart';

final String adMobAppID = 'ca-app-pub-8811794994870209~9624947035';

final String adMobUnitId = 'ca-app-pub-8811794994870209/4311435829';

class Constants {
  static const Map<String, dynamic> Share = {
    'label': 'Share',
    'icon': Icon(Icons.share),
    'color': Colors.indigo,
  };
  static const Map<String, dynamic> Report = {
    'label': 'Report',
    'icon': Icon(Icons.report),
    'color': Colors.red,
  };

  static const List<Map<String, dynamic>> choices = <Map<String, dynamic>>[
    Share,
    Report,
  ];
}
