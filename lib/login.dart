import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin {

  /* Animation Controller */
  AnimationController _iconAnimationController;
  Animation<double> _iconAnimation;

  @override
  void initState(){
    super.initState();
    _iconAnimationController = new AnimationController(
      vsync: this,
      duration: new Duration(microseconds: 500)
    );
    _iconAnimation = new CurvedAnimation(
      parent: _iconAnimationController,
      curve: Curves.easeInOut
    );

    _iconAnimation.addListener(()=>this.setState((){} ));
    _iconAnimationController.forward();

  }

  /* Animation Controller */
  
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
            Image.asset('images/bee.jpg',height: _iconAnimation.value * 100 ,),
            

            ],
          )
        ],
      ),
      
    );
  }
}
