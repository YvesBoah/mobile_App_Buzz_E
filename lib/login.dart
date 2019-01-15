import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   
      // ),  
      backgroundColor: Colors.greenAccent,
      body: new Stack(
        fit:StackFit.expand,
        children: <Widget>[
          new Image (
          image : new AssetImage('images/z.jpg'),
          fit:BoxFit.cover, 
          color: Colors.black87,
          colorBlendMode: BlendMode.darken,
          ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            Image.asset('images/bee.jpg',height: 150.0,),
            

            ],
          )
        ],
      ),
      
    );
  }
}
