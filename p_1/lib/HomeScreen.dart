import 'package:flutter/material.dart';

 class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);


   @override
   Widget build(BuildContext context) {
    return Scaffold(
         appBar: AppBar(             // AppBar
         leading:IconButton(
         onPressed: (),{},
    icon: Icon(Icons,menu),
    ) ,
       title:Text('Home page') ,
        centerTitle: true,
     actions: [
         IconButton(
          onPressed: (),{},
          icon: Icon(Icons,portable_wifi_off_outlined),
    ) ,
     IconButton(
       onPressed: (),{},
       icon: Icon(Icons,portable_wifi_off_outlined),
     ) ,

    ],
                                //Body
     body:Column(
        children: [
          Center(child: Text('Trina')),
          Center(child: Text('Trina')),
           Center(child: Text('Trina')),
           Center(child: Text('Trina')),

     ],
       ),
                                         //Drawer

        drawer:Drawer(
         child: Column(children: [               //Listview
           Card(child: Text('Login'),            //Container
    )
        Card(child: Text('About Me'),
     )
         Card(child: Text('policy'),
    )
    ],
     ),

     ),







       // body: ,
     // drawer: ,
      // bottomNavigationBar: ,
      // floatingActionButton: ,
   );
  }
 }
