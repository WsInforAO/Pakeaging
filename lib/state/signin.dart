import 'package:flutter/material.dart';
import 'package:nskwhs/state/login.dart';

class Singin extends StatefulWidget {
  @override
  _SinginState createState() => _SinginState();
}

class _SinginState extends State<Singin> {


  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
              child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildImage(),
            buildOutlineButton(),
          ],
        ),
      ),
    );
  }

  Container buildOutlineButton() => Container(
        padding: EdgeInsets.all(16),
        width: MediaQuery.of(context).size.width,
        child: OutlineButton(
          onPressed: () => Navigator.push( //Go to 2nd page and back to 1st page
              context,
              MaterialPageRoute(
                builder: (context) => Login(),
              )),
          child: Text('SIGN IN'),
        ),
      );

  Container buildImage() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height - 105,
      child: Image.asset(
        'images/wall.jpg',
        fit: BoxFit.cover,
      ),
    );
  }
}
