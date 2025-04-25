import 'package:application_laboratorio3/pages/myhomepage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const appname = 'Practicas Flutter';
    var logger = Logger(printer: PrettyPrinter());
    logger.i('Logger is working!');
    return MaterialApp(
      title: appname,
      theme: ThemeData(
        // This is the theme of your application.
        //
        colorScheme: ColorScheme.fromSeed(seedColor: 
        Colors.purple,brightness: 
        Brightness.dark),
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        textTheme: TextTheme(displayLarge: const TextStyle(
          fontSize: 72,
          fontWeight: FontWeight.bold
        ),
        
        titleLarge: GoogleFonts.oswald(fontSize: 30
        ,fontStyle: FontStyle.italic))
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
      ),
      home: const MyHomePage(title: 'Flutter Laboratorio 2 DM'),
    );
  }
}


