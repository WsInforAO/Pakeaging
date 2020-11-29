import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nskwhs/utility/normall_dialog.dart';

class InWH extends StatefulWidget {
  @override
  _InWHState createState() => _InWHState();
}

class _InWHState extends State<InWH> {
  FocusNode focusNode = FocusNode();
  String result;
  List<String> codeReaders = List();
  List<int> qtys = List();
  TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startFocus();
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  Future<Null> startFocus() async {
    Duration duration = Duration(seconds: 1);
    Timer(duration, () {
      FocusScope.of(context).requestFocus(focusNode);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: buildFloatingActionButton(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildAboutTextField(context),
            buildRowHead(),
            buildListCode(),
          ],
        ),
      ),
    );
  }

  Padding buildAboutTextField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          buildTextfield(),
          IconButton(
              icon: Icon(Icons.save, size: 48),
              onPressed: () {
                if (codeReaders.length == 0) {
                  normalDialog(context, 'Please Scan Code Before Click');
                } else {
                  // inser value to API server
                  print(
                      'Value Code Isert to Server ===>>> ${codeReaders.toString()},QTY code ===>>> ${qtys.toString()}');
                }
              }),
        ],
      ),
    );
  }

  Widget buildListCode() {
    return codeReaders.length == 0
        ? SizedBox()
        : ListView.builder(
            shrinkWrap: true,
            physics: ScrollPhysics(),
            itemCount: codeReaders.length,
            itemBuilder: (context, index) => Dismissible(
                onDismissed: (direction) {
                  setState(() {
                    codeReaders.removeAt(index);
                  qtys.removeAt(index);
                  });
                },
                background: Container(
                  color: Colors.red,
                  child: Text('Delete Item'),
                ),
                key: Key(codeReaders[index]),
                child: Card(
                  color: index % 2 == 0 ? Colors.blue.shade200 : Colors.white ,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 4,
                          child: Text(
                            codeReaders[index],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            qtys[index].toString(),
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
          );
  }

  FloatingActionButton buildFloatingActionButton() {
    return FloatingActionButton(
      onPressed: () {
        result = textEditingController.text;
        print('### result = $result');

        if (result == null || result.isEmpty) {
          normalDialog(context, 'Have Space ?');
        } else {
          setState(() {
            if (checkCode(result)) {
              codeReaders.add(result);
              qtys.add(1);
            } else {
              print('Code Duplicate');
            }
            textEditingController.clear();
          });
        }
      },
    );
  }

  bool checkCode(String string) {
    bool check = true;
    int index = 0;
    for (var item in codeReaders) {
      if (item == string) {
        check = false;
        print('index duplicate ==>> $index');
        setState(() {
          qtys[index]++;
        });
      }
      index++;
    }
    return check;
  }

  Widget buildRowHead() {
    return Container(
      decoration: BoxDecoration(color: Colors.grey.shade300),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Box Name'),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('QTY'),
            ),
          ),
        ],
      ),
    );
  }

  Container buildTextfield() {
    return Container(
      width: 250,
      child: TextField(
        controller: textEditingController,
        focusNode: focusNode,
        autofocus: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
