import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meme_genaretor/splashScreen.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: App(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey globalKey = new GlobalKey();

  String headerText = "";
  String footerText = "";

  File _image;
  File _imageFile;

  bool imageSelected = false;

  Random rng = new Random();

  Future getImage() async {
    var image;
    try {
      image = await ImagePicker.pickImage(source: ImageSource.gallery);
    } catch (platformException) {
      print("not allowing " + platformException);
    }
    setState(() {
      if (image != null) {
        imageSelected = true;
      } else {}
      _image = image;
    });
    new Directory('storage/emulated/0/' + 'MemeGenerator')
        .create(recursive: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(


          child: Column(
            children: <Widget>[
              SizedBox(
                height: 30,
              ),
             Container(
               decoration: BoxDecoration(
                 gradient: LinearGradient(
                     begin: Alignment.topRight,
                     end: Alignment.bottomLeft,
                   colors: [Colors.greenAccent,Colors.white,Colors.greenAccent]
                 )
               ),
               width: MediaQuery.of(context).size.width,
               child: Column(
                 children: [
                   Image.asset(
                     "images/h1.png",
                     height: 70,
                   ),
                   Image.asset(
                     "images/h2.png",
                     height: 70,
                   ),
                 ],
               ),
             ),

              SizedBox(
                height: 14,
              ),
              RepaintBoundary(
                key: globalKey,
                child: Stack(
                  children: <Widget>[
                    _image != null
                        ? Container(
                      alignment: Alignment.center,
                      height: 300.0,

                      child: Image.file(
                        _image,
                        height:300,


                        fit: BoxFit.cover,
                      ),
                    )
                        : Container(),
                    Container(

                      width: MediaQuery.of(context).size.width,
                      height: 300,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(

                            padding: EdgeInsets.symmetric(vertical: 8),
                            child: Text(
                              headerText.toUpperCase(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 26,
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
                          ),
                          Spacer(),
                          Container(

                              padding: EdgeInsets.symmetric(vertical: 8),
                              child: Text(
                                footerText.toUpperCase(),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 26,
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
                              ))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              imageSelected
                  ? Container(

                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: <Widget>[
                    TextField(
                      onChanged: (val) {
                        setState(() {
                          headerText = val;
                        });
                      },
                      decoration: InputDecoration(hintText: "Header Text",
                      hintStyle: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,color: Colors.grey)
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    TextField(
                      onChanged: (val) {
                        setState(() {
                          footerText = val;
                        });
                      },
                      decoration: InputDecoration(hintText: "Footer Text",
                          hintStyle: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,color: Colors.grey)
                      ),
                    ),
                    SizedBox(height: 20,),
                    RaisedButton(
                      color: Colors.blue,
                      onPressed: () {
                        //TODO
                        takeScreenshot();
                      },
                      child: Text("Save",style: TextStyle(color: Colors.white,fontSize: 18.0,fontWeight: FontWeight.w500),),
                    )
                  ],
                ),
              )
                  : Container(

                child: Center(
                  child: Text("Select image to get started",style: TextStyle(color: Colors.black,fontSize: 18.0,fontWeight: FontWeight.bold),),
                ),
                //color: Colors.red,
              ),
              _imageFile != null ? Image.file(_imageFile) : Container(),
            ],
          ),

        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getImage();
        },
        child: Icon(Icons.add_a_photo),
      ),
      floatingActionButtonLocation:
      FloatingActionButtonLocation.miniEndDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.yellowAccent,

    shape: CircularNotchedRectangle(),
    notchMargin: 4.0,
    child: new Row(
    mainAxisSize: MainAxisSize.max,
   // mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
   IconButton(icon: Icon(Icons.menu,color: Colors.yellowAccent,), onPressed: () {},),
     SizedBox(width: 90.0,),
    Text('Select image',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 18.0),),
    Icon(Icons.arrow_forward,color: Colors.grey,)
    //IconButton(icon: Icon(Icons.search), onPressed: () {},),
    ],
    ),
      )
    );
  }

  takeScreenshot() async {
    RenderRepaintBoundary boundary =
    globalKey.currentContext.findRenderObject();
    ui.Image image = await boundary.toImage();
    final directory = (await getApplicationDocumentsDirectory()).path;
    ByteData byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    Uint8List pngBytes = byteData.buffer.asUint8List();
    print(pngBytes);
    File imgFile = new File('$directory/screenshot${rng.nextInt(200)}.png');
    setState(() {
      _imageFile = imgFile;
    });
    _savefile(_imageFile);
    //saveFileLocal();
    imgFile.writeAsBytes(pngBytes);
  }

  _savefile(File file) async {
    await _askPermission();
    final result = await ImageGallerySaver.saveImage(
        Uint8List.fromList(await file.readAsBytes()));
    print(result);
  }

  _askPermission() async {
    Map<PermissionGroup, PermissionStatus> permissions =
    await PermissionHandler().requestPermissions([PermissionGroup.photos]);
  }
}