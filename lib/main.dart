import 'package:flutter/material.dart';
import 'Pages/Acceuil.dart';
void main(){
  runApp( new MyApp() );
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new LoginPage(),
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}


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
      duration: new Duration(microseconds: 1500)
    );
    _iconAnimation = new CurvedAnimation(
      parent: _iconAnimationController,
      curve: Curves.bounceOut
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
             Image.asset('images/beee.gif',height: _iconAnimation.value*100),
             
            // new FlutterLogo(
            //   size: _iconAnimation.value*100,
            // )
           
             new Form( 
              child: new Theme(
                data: new ThemeData(
                  brightness: Brightness.dark , primarySwatch: Colors.teal, 
                  inputDecorationTheme: new InputDecorationTheme(
                    labelStyle: new TextStyle(
                      color: Colors.white,
                      fontSize: 20.0
                    )
                  )
                ),
                child: new Container(
                  padding: const EdgeInsets.all(10.0),
                 child: new Column(
                   crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                   new TextFormField(
                      decoration: new InputDecoration(
                        labelText: "Entrer votre email"
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                     new TextFormField(
                      decoration: new InputDecoration(
                        labelText: "Entrer votre mot passe"
                      ),
                      keyboardType: TextInputType.text,
                      // obscureText: true,
                    ),
                    new Padding(
                      padding: const EdgeInsets.only(top:40),
                    ),
                    new MaterialButton(
                      height: 49.0,
                      minWidth: 500.0,
                      color: Colors.red,
                      textColor: Colors.white,
                      child: new Text("Connexion"),
                      onPressed: versHome,
                    ),
                  ],
                ),
              ),
            ),
             
             
            )
            ],
          )
        ],
      ),
      
    );
  }

void versHome()=> Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context){
    return new Home();
  }));

}