import 'package:flutter/material.dart';
import 'package:nskwhs/utility/my_style.dart';

class OutWH extends StatefulWidget {
  @override
  _OutWHState createState() => _OutWHState();
}

class _OutWHState extends State<OutWH> {
  List<String> resultSeachs = List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readDataFromServer();
  }

  Future<Null> readDataFromServer() async {
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          buildTextFieldSeach(),
          buildResultSeach(),
        ],
      ),
    );
  }

  Widget buildResultSeach() => Text('Please Type Seach Customer');

  Widget buildTextFieldSeach() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.all(16),
          width: 250,
          height: 50,
          decoration: MyStyle().bixDecarationTextField2(),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Seach Customer',
              prefixIcon: Icon(
                Icons.search,
              ),
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}
