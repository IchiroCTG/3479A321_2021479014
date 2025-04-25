import 'package:application_laboratorio3/pages/myhomepage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const appname = 'Practicas Flutter';
    var logger = Logger(printer: PrettyPrinter());
    logger.i('Logger is working!');
    return MaterialApp(
      title: appname,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: 
        Colors.purple,brightness: 
        Brightness.dark),

        textTheme: TextTheme(displayLarge: const TextStyle(
          fontSize: 72,
          fontWeight: FontWeight.bold
        ),
        
        titleLarge: GoogleFonts.oswald(fontSize: 30
        ,fontStyle: FontStyle.italic))

      ),
      home: const MyHomePage(title: 'Flutter Laboratorio 2 DM'),
    );
  }
}


