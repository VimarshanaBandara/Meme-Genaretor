import 'package:flutter/material.dart';
import 'dart:async';

import 'main.dart';


class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplachScreen(),
    );
  }
}

class SplachScreen extends StatefulWidget {
  @override
  _SplachScreenState createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> {

  @override
  void initState() {

    super.initState();
    displaySplash();
  }

  displaySplash(){

    Timer(Duration(seconds: 5), () async{



     Route route = MaterialPageRoute(builder: (_) => HomePage());
        Navigator.pushReplacement(context, route);


    });

  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [

          Container(

            decoration:   BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/h3.jpg'),
              fit: BoxFit.cover
            )

            ),

          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      Padding(
                        padding: EdgeInsets.only(top: 70.0),

                      ),
                      Text("Welcome",style: TextStyle(color: Colors.white,fontSize: 35.0,fontWeight: FontWeight.bold ,fontFamily:'gfont',
                       shadows: <Shadow>[
                       Shadow(
                       offset: Offset(2.0, 2.0),
                       blurRadius: 3.0,
                        color: Colors.black87,
                      ),
                        Shadow(
                       offset: Offset(2.0, 2.0),
                       blurRadius: 8.0,
                       color: Colors.black87,
                       ),
                       ],),
                      ),
                    ],
                  ),
                ),

              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LinearProgressIndicator(backgroundColor: Colors.white),



                     Text("Easy ",style: TextStyle(color: Colors.white,fontSize: 35.0,fontWeight: FontWeight.bold,
                          shadows: <Shadow>[
                          Shadow(
                          offset: Offset(2.0, 2.0),
                          blurRadius: 3.0,
                          color: Colors.black87,
                           ),
                            Shadow(
                        offset: Offset(2.0, 2.0),
                       blurRadius: 8.0,
                       color: Colors.black87,
                       ),
                     ],),
                     ),



                      Text("Meme Generetor",style: TextStyle(color: Colors.white,fontSize: 35.0,fontWeight: FontWeight.bold,

                       shadows: <Shadow>[
                       Shadow(
                      offset: Offset(2.0, 2.0),
                      blurRadius: 3.0,
                       color: Colors.black87,
                     ),
                         Shadow(
                    offset: Offset(2.0, 2.0),
                     blurRadius: 8.0,
                     color: Colors.black87,
                   ),
                   ],),
                      ),


                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}