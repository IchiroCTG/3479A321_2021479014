import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:logger/logger.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  


  final String title;
  
  @override
  State<MyHomePage> createState() => _MyHomePageState();
  
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
 
  @override
  Widget build(BuildContext context) {

    var logger = Logger(printer: PrettyPrinter());
    logger.i('HomePage Widget is Working!');
    
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
            Row(children: persistentFooterButtons,mainAxisAlignment: MainAxisAlignment.spaceAround,
            ),
          ]     
        ),
      
      
    );
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Center(
          child: card,

      ),
 
      //persistentFooterButtons: persistentFooterButtons, 
    );
  }
}