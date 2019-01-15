import 'package:flutter/material.dart';

class ActionsClot extends StatefulWidget {

   ActionsClot(String title){
     this.title = title;
   }
  String title;

  @override
  ActionsClotState createState() {
    return new ActionsClotState();
  }
}

class ActionsClotState extends State<ActionsClot> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}