import 'package:flutter/material.dart';
import 'package:nskwhs/state/recieving.dart';
import 'package:nskwhs/state/storing.dart';
import 'package:nskwhs/state/supplying.dart';

class MyConstant {
  String domain = 'https://9ed2619cc439.ngrok.io';
  List<String> titleMenus = ['RECIEVING', 'STORING', 'SUPPLYING'];
  List<IconData> iconMenus = [Icons.filter_1, Icons.filter_2, Icons.filter_3];
  List<Widget> currentWidgets = [Recieving(), Storing(), Supplying()];
  List<List<String>> subTitles = [[],['BOX BY BOX','BIB TO BIN'],[]];
  
  MyConstant();
}
