
import 'dart:io';

import 'package:application_laboratorio3/pages/aboutPage.dart';
import 'package:application_laboratorio3/pages/activityPage.dart';
import 'package:application_laboratorio3/pages/cameraPage.dart';
import 'package:application_laboratorio3/pages/galery.dart';
import 'package:application_laboratorio3/pages/listContent_page.dart';
import 'package:application_laboratorio3/pages/preferencePage.dart';
import 'package:application_laboratorio3/services/dataBaseHelper.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:flutter_svg/flutter_svg.dart';
import 'package:logger/logger.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  


  final String title;
  
  @override

  State<MyHomePage> createState(){

    return _MyHomePageState();
  }

}
const String rutaIcon1 = 'Assets/Icons/person_ckbul61rtesg.svg' ;

class _MyHomePageState extends State<MyHomePage> {
  final DatabaseHelper _dbHelper = DatabaseHelper(); //Instancia de la clase DatabaseHelper
  int _counter = 0;
  int _counterImage = 1;
  bool _isResetEnabled= false;
  var logger = Logger(printer: PrettyPrinter());
  String? _imagePath;
  String newImagePath = 'https://picsum.photos/250?image=1';
  List<String> _galleryPaths =[];
  void _newImagePath (){
    setState(() {
      newImagePath = 'https://picsum.photos/250?image=$_counterImage';
    });
    
  }
  String _getNewImagePath() {
    return newImagePath;
  }
  Future<void> _loadPreference() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _isResetEnabled = prefs.getBool('isResetEnabled') ?? false;
    });
  }
  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }
  void _nextImage() {
    setState(() {

      _counterImage++;
    });
  }
  void _previousImage() {
    setState(() {
      if (_counterImage > 1) {
        _counterImage--;
      }
    });
  }
  void _decrementCounter(){
    setState(() {
      
      _counter--;
    });
  }
  void _resetCounter(){
    setState(() {
      _counter=0;
    });
  }
  void _nextPage(){
      Navigator.push(context, MaterialPageRoute(builder: (context) => listContentPage()));
  }
 
  @override
  initState() {
    super.initState();
    logger.i('initState() called');
    _loadPreference();
  }
  @override
  Widget build(BuildContext context) {

    
    logger.i('Homepage iniciada, Building widget');
    
 /*
     @override
    didChangeDependencies() {
      logger.i('didChangeDependencies() called');
    }
     @override
    didUpdateWidget(oldWidget){
      logger.i('didUpdateWidget() called');
    }
     @override
    deactivate(){
      logger.i('deactivate() called');
    }
     @override
    dispose(){
      logger.i('dispose() called');
    }
    @override
    reassemble(){
      logger.i('reassemble() called');
    }
    final Widget svgIcon = SvgPicture.asset(rutaIcon1, 
    semanticsLabel:'Person1');
    */
    

 

    var persistentFooterButtons = [
        TextButton(onPressed: _incrementCounter, child: Icon(Icons.plus_one),style: TextButton.styleFrom(foregroundColor: Colors.red)), //Boton de incrementar
        TextButton(onPressed: _decrementCounter, child: Icon(Icons.exposure_minus_1),style: TextButton.styleFrom(foregroundColor: Colors.red)), //Boton de incrementar
        TextButton(onPressed: _isResetEnabled?(){ _resetCounter();}:null, child: Icon(Icons.exposure_zero),style: TextButton.styleFrom(foregroundColor: Colors.red)),
        TextButton(onPressed:() async{await _dbHelper.deleteDatabaseFile();}, child: Text("Delete"),style: TextButton.styleFrom(foregroundColor: Colors.red)),
      ];
    var card = Card(
      clipBehavior: Clip.hardEdge,
      color: Colors.white,
      child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _imagePath != null
                ? Image.file(
                    File(_imagePath!),
                    width: 250,
                    height: 250,
                    fit: BoxFit.cover,
                  )
                : Container(
                    width: 250,
                    height: 250,
                    color: Colors.grey[300],
                    child: const Center(child: Text('No image selected')),
                  ),    
            /*Image.network(_getNewImagePath(), 
            width: 250, 
            height: 250, 
            fit: BoxFit.cover, 
            ),*/                   
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Las veces que has presionado el boton es: ',style: TextStyle(color: Colors.black)),
                Text('$_counter',style: TextStyle(color: Colors.black))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(onPressed: _previousImage, child: Text('Anterior Imagen'),style: TextButton.styleFrom(foregroundColor: Colors.red)), //Boton de decrementar
                TextButton(onPressed: _nextImage, child: Text('Siguiente Imagen'),style: TextButton.styleFrom(foregroundColor: Colors.red)), //Boton de incrementar
                TextButton(onPressed: _newImagePath, child: Text('Nueva Imagen'),style: TextButton.styleFrom(foregroundColor: Colors.red)), //Boton de incrementar               
              ],
            ),
            Row(
              children: persistentFooterButtons,mainAxisAlignment: MainAxisAlignment.spaceAround,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(onPressed: _nextPage 
                , child: Text('Siguiente'),style: TextButton.styleFrom(foregroundColor: Colors.black,backgroundColor: Colors.red),)
            ],),
          ]     
        ),
      
      
    );
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Menu'),
            ),
            ListTile(
              title: const Text('List Content'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => listContentPage()));
              },
            ),
            ListTile(
              title: const Text('About'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => aboutPage()));
              },
            ),
            ListTile(
              title: const Text('Preferencias'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => preferencePage())).then((_){
                  _loadPreference();
                });
              },
            ),
            ListTile(
              title: const Text('Actividades'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => activityPage())).then((_){
                  _loadPreference();
                });
              },
            ),
            ListTile(
              title: const Text('Camera Page'),
              onTap: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const cameraPage()),
                );
                if (result != null && result is String) {
                  setState(() {
                    _imagePath = result; // Update the image path with the result
                    _galleryPaths.add(result); // Add the new image path to the gallery
                  });
                }
              },
            ),
            ListTile(
              title: const Text('Galería'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GalleryPage(imageUrls: _galleryPaths),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: Center(
          child: card,

      ),
 
      //persistentFooterButtons: persistentFooterButtons, 
    );
  }
}
