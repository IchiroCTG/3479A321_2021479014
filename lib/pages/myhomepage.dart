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
        TextButton(onPressed: _incrementCounter, child: Icon(Icons.plus_one)), //Boton de incrementar
        TextButton(onPressed: _decrementCounter, child: Icon(Icons.exposure_minus_1)), //Boton de incrementar
        TextButton(onPressed: _resetCounter, child: Icon(Icons.exposure_zero)) //Boton de incrementar
      ];
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Center(

          child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Flutter es un SDK de código abierto para crear aplicaciones nativas desde una sola base de código'
            ),
            svgIcon,
            const Text('Las veces que has pulsado el boton es de:'),
            Text(
                '$_counter',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
            
            
          ),
      ),
 
      persistentFooterButtons: persistentFooterButtons, 
    );
  }
}