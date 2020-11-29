import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyStyle {
  Color darkBackgroud = Color(0xff3C444D);
  Color buttomColor1 = Color(0xff3C444D);
  //Color buttomColor1 = Colors.purpleAccent[400];
  Widget showProgress() {
    return Center(child: CircularProgressIndicator());
  }

  RoundedRectangleBorder roundType1() {
    return RoundedRectangleBorder(
      side: BorderSide(
        color: Colors.white,
        width: 1,
      ),
      borderRadius: BorderRadius.circular(30),
    );
  }

  BoxDecoration bixDecarationTextField() {
    return BoxDecoration(color: Colors.white);
  }

  TextStyle titleH1() {
    return TextStyle(
      fontSize: 30,
      color: Colors.white,
    );
  }

  TextStyle titleH2() {
    return TextStyle(
      fontSize: 14,
      color: Colors.white,
    );
  }

  MyStyle();
}
