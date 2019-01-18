import 'dart:convert';

import 'package:flutter/material.dart';
import 'Pages/Acceuil.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

void main() {
  runApp(new MyApp());
}
String email;
String nom;
String tel;
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new LoginPage(),
      // routes: <String,Widget>{
      //   '/Accueil':(BuildContext context)=> new Home()
      // },
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

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  /* Animation Controller */
  AnimationController _iconAnimationController;
  Animation<double> _iconAnimation;

  @override
  void initState() {
    super.initState();
    _iconAnimationController = new AnimationController(
        vsync: this, duration: new Duration(microseconds: 1500));
    _iconAnimation = new CurvedAnimation(
        parent: _iconAnimationController, curve: Curves.bounceOut);

    _iconAnimation.addListener(() => this.setState(() {}));
    _iconAnimationController.forward();
  }

  /* Animation Controller */

  /* Verification du Login et Mot de Passe */
  TextEditingController user = new TextEditingController();
  TextEditingController pass = new TextEditingController();
  String msg="";
  String msgt="";
  /* Verification du Login et Mot de Passe */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //
      // ),
      backgroundColor: Colors.greenAccent,
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Image(
            image: new AssetImage('images/z.jpg'),
            fit: BoxFit.cover,
            color: Colors.black87,
            colorBlendMode: BlendMode.darken,
          ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('images/beee.gif',
                  height: _iconAnimation.value * 100),

              // new FlutterLogo(
              //   size: _iconAnimation.value*100,
              // ),

              new Form(
                child: new Theme(
                  data: new ThemeData(
                      brightness: Brightness.dark,
                      // primarySwatch: Colors.teal,
                      inputDecorationTheme: new InputDecorationTheme(
                          labelStyle: new TextStyle(
                              color: Colors.white, fontSize: 20.0))),
                  child: new Container(
                    padding: const EdgeInsets.all(10.0),
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        new TextFormField(
                          controller: user,
                          decoration: new InputDecoration(
                              labelText: "Entrer votre email"),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        new TextFormField(
                          controller: pass,
                          decoration: new InputDecoration(
                              labelText: "Entrer votre mot passe"),
                          keyboardType: TextInputType.text,
                          // obscureText: true,
                        ),
                        new Padding(
                          padding: const EdgeInsets.only(top: 40),
                        ),
                        new MaterialButton(
                          height: 49.0,
                          minWidth: 500.0,
                          color: Colors.red,
                          textColor: Colors.white,
                          child: new Text("Connexion"),
                          // onPressed: versHome,
                          onPressed: () {
                            _login();
                          },
                        ),
                        Text(msg,style: TextStyle(fontSize: 20.0,color: Colors.red)),
                        Text(msgt,style: TextStyle(fontSize: 20.0,color: Colors.green)),
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

  Future<List> _login() async {
    final response = await http.post(
        "http://173.212.254.179:3333/api/v1/controlleur/login",
        body: {"email": user.text, "password": pass.text});
    var dataUser = json.decode(response.body);
  // print(dataUser.length);
    if (dataUser.length == 0) {
      setState(() {
              msg="Veuillez reinseigner ces champs svp !";
              // msgt="";
            });
    }
    if (dataUser.length == 1) {
      setState(() {
              msg="Email ou mot de passe incorrecte !";
              // msgt="";
            });
    }
    if (dataUser.length == 2) {
      setState(() {
              // msgt="Success";
              msg="";
              nom = dataUser['user']['nom'];
              email = dataUser['user']['email'];
              tel = dataUser['user']['tel'];
              versHome();
            });

    }
    // return dataUser;
  }

  void versHome() => Navigator.push(context,
          new MaterialPageRoute(builder: (BuildContext context) {
        return new Home(nom,email,tel);
      }));
}
