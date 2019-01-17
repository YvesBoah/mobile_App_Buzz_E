import 'package:flutter/material.dart';
import 'action_cours.dart';
import 'action_clot.dart';
import 'scan.dart';
import '../main.dart';


void main(){
  runApp( new MyApp() );
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'BUZZ EVENT',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      debugShowCheckedModeBanner: false,
      home: new Home(),
    );
  }
}

class Home extends StatefulWidget {
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text('BUZZ EVENT') ,
        // title : Image.asset('images/lol.png',
        //          height: 80.0,
        //          width: 150.0,
                 
        //           ),
       
        actions: <Widget>[
          
        ],
        centerTitle: true,
        elevation: 10.0,
      ),
      body: 
    
       Column(
  children: <Widget>[
    Text(''),
    Text('Acceuil'),
    Text(''),
    
    Expanded(
      child: //--------- Grid view ----------//
    
        CustomScrollView(
              primary: false,
              slivers: <Widget>[
                SliverPadding(
                  padding: const EdgeInsets.all(20.0),
                  sliver: SliverGrid.count(
                    crossAxisSpacing: 10.0,
                    crossAxisCount: 2,
                    children: <Widget>[
                      const Text('He\'d have you all unravel at the'),
                      const Text('Heed not the rabble'),
                      const Text('Sound of screams but the'),
                      const Text('Who scream'),
                      const Text('Who scream'),
                      const Text('Revolution is coming...'),
                      const Text('Revolution is coming...'),
                      const Text('Revolution, they...'),
                    ],
                  ),
                ),
              ],
            ), 
  
      //--------- Grid view ----------//
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Text('Copyright Innovation Foundation',
        textAlign: TextAlign.center,
        style: new TextStyle(
          color: Colors.orange,
          fontSize: 15.0,
          fontStyle: FontStyle.italic
         ),
        ),
        
      ],
    )
    // Expanded(
    //   child: Text('HELLO JE SUIS UN TEXT IMBRIQUER'),
    // ),
  ],
),
     
   

      
      // --------- Menu du Scaffold  --------- //
      drawer : Drawer(
        
  // Add a ListView to the drawer. This ensures the user can scroll
  // through the options in the Drawer if there isn't enough vertical
  // space to fit everything.
  child: ListView(
    // Important: Remove any padding from the ListView.
    padding: EdgeInsets.zero,
    children: <Widget>[
      DrawerHeader(
        child: Column(
          children: <Widget>[
           //CircleAvatar(
             //child:
            Image.asset('images/lol.png',
                 height: 80.0,
                 width: 180.0,
                 
                  ),
          // ),
                  
              
           
            Text(''),
            Text('Organisation d\'évènement ',
                  style: TextStyle(fontWeight: FontWeight.w500)),
            Text('Administrateur Système'),
          ],
        
        ),
        decoration: BoxDecoration(
          color: Colors.white,
        ),   
      ),
     ListTile(
       
              title: Text('En cours',
              style: TextStyle(fontWeight: FontWeight.w500)),
              subtitle: Text('Evènement actuel'),
              onTap: versActionEnCours,
              leading: Icon(
                Icons.access_time,
                color: Colors.orange,
                
              ),
              
              
              
      ),
     ListTile(
              title: Text('Clôt',
                  style: TextStyle(fontWeight: FontWeight.w500)),
              subtitle: Text('Evènement terminer'),
              onTap:versActionsClot,
              leading: Icon(
                Icons.alarm_off,
                color: Colors.orange,
              ), 
      ),
     ListTile(
              title: Text('Scanner un ticket',
                  style: TextStyle(fontWeight: FontWeight.w500)),
              subtitle: Text('Scan'),
              onTap:faireUnScan,
              leading: Icon(
                Icons.camera_alt,
                color: Colors.orange,
              ), 
      ),
      ListTile(
        title: Text('Déconnextion',style: TextStyle(fontWeight: FontWeight.w500)),
        subtitle: Text('Quitter l\'application'),
        onTap: versLogin,
        leading: Icon(Icons.cancel,color: Colors.red),
      ),
      ListTile(
        title: Text('Fermer',style: TextStyle(fontWeight: FontWeight.w500)),
        subtitle: Text('Reduire le Menu'),
        leading: Icon(Icons.close,color: Colors.red),
        onTap: () {
          // Update the state of the app
          // ...
           Navigator.pop(context); //Ferme le petit Menu
        },
      ),
    ],
  ),
),

     // --------- Fin du Menu du Scaffold (Drawer) --------- //
  
      
    
    );
        
  }

// Route

void versActionEnCours(){
  Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context){
    return new ActionsCours('les actions en cours');
  }));
}

void versActionsClot(){
  Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context){
    return new ActionsClot('les actions clôts');
  }));
}

void faireUnScan(){
  Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context){
    return new Scan('Scanner');
  }));
}
void versLogin(){
  Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context){
    return new LoginPage();
  }));
}


}

