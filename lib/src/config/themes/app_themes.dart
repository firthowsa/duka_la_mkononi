import 'package:flutter/material.dart';

import 'color_schemes.g.dart';

abstract class AppTheme {
  static ThemeData get light {
    return ThemeData(
        useMaterial3: true,
        //colorSchemeSeed: Colors.green[500],
        colorScheme: lightColorScheme
    );
  }

  static ThemeData get dark {
    return ThemeData(
        useMaterial3: true,
        //colorSchemeSeed: Colors.orange[700],
        colorScheme: darkColorScheme
    );
  }


}