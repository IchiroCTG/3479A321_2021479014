
import 'package:application_laboratorio3/pages/aboutPage.dart';
import 'package:application_laboratorio3/pages/listContent_page.dart';
import 'package:application_laboratorio3/pages/preferencePage.dart';
import 'package:flutter/material.dart';
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
  int _counter = 0;
  
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
  Widget build(BuildContext context) {

    var logger = Logger(printer: PrettyPrinter());
    logger.i('Homepage iniciada, Building widget');
    /*initState() {
      logger.i('initState() called');
    }
    didChangeDependencies() {
      logger.i('didChangeDependencies() called');
    }
    didUpdateWidget(oldWidget){
      logger.i('didUpdateWidget() called');
    }
    deactivate(){
      logger.i('deactivate() called');
    }
    dispose(){
      logger.i('dispose() called');
    }
    reassemble(){
      logger.i('reassemble() called');
    }*/
        final Widget svgIcon = SvgPicture.asset(rutaIcon1, 
          semanticsLabel:'Person1');

    var persistentFooterButtons = [
        TextButton(onPressed: _incrementCounter, child: Icon(Icons.plus_one),style: TextButton.styleFrom(foregroundColor: Colors.red),), //Boton de incrementar
        TextButton(onPressed: _decrementCounter, child: Icon(Icons.exposure_minus_1),style: TextButton.styleFrom(foregroundColor: Colors.red)), //Boton de incrementar
        TextButton(onPressed: _resetCounter, child: Icon(Icons.exposure_zero),style: TextButton.styleFrom(foregroundColor: Colors.red)) //Boton de incrementar
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => preferencePage()));
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