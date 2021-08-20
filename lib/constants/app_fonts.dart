import 'package:flutter/material.dart';
import 'package:userdata/config/size-config.dart';

// App Fonts Class - Resource class for storing app level font constants
class AppFonts {
  static TextStyle valueStyle = TextStyle(
    fontSize: SizeConfig.textMultiplier! * 2.3,
    color: Colors.black,
    fontWeight: FontWeight.w700,
    fontFamily: 'Ubuntu',
  );

  static TextStyle body1 = TextStyle(
    fontSize: SizeConfig.textMultiplier! * 1.8,
    fontWeight: FontWeight.w400,
    fontFamily: 'Ubuntu',
    color: Colors.black,
  );

  static TextStyle body2 = TextStyle(
    fontSize: SizeConfig.textMultiplier! * 1.3,
    fontWeight: FontWeight.w400,
    fontFamily: 'Ubuntu',
    color: Colors.black,
  );
}
