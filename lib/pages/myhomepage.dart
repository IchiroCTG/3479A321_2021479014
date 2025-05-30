
import 'package:application_laboratorio3/pages/aboutPage.dart';
import 'package:application_laboratorio3/pages/activityPage.dart';
import 'package:application_laboratorio3/pages/listContent_page.dart';
import 'package:application_laboratorio3/pages/preferencePage.dart';
import 'package:application_laboratorio3/services/dataBaseHelper.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
  bool _isResetEnabled= false;
  var logger = Logger(printer: PrettyPrinter());
  
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
    }*/
        final Widget svgIcon = SvgPicture.asset(rutaIcon1, 
          semanticsLabel:'Person1');

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
            svgIcon,                  
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Las veces que has presionado el boton es: ',style: TextStyle(color: Colors.black)),
                Text('$_counter',style: TextStyle(color: Colors.black))
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
            )
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