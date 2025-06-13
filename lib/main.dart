import 'package:application_laboratorio3/pages/myhomepage.dart';
import 'package:application_laboratorio3/services/dataBaseHelper.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';
import 'package:application_laboratorio3/theme/theme.dart';
import 'package:application_laboratorio3/theme/util.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseHelper().initializeDatabase(); 
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const appname = 'Practicas Flutter';
    var logger = Logger(printer: PrettyPrinter());
    logger.i('Logger is working!');
    final brightness = View.of(context).platformDispatcher.platformBrightness;

    // Retrieves the default theme for the platform
    //TextTheme textTheme = Theme.of(context).textTheme;

    // Use with Google Fonts package to use downloadable fonts
    TextTheme textTheme = createTextTheme(context, "Baumans", "Acme");

    MaterialTheme theme = MaterialTheme(textTheme);
    return MaterialApp(
      title: appname,
      theme: brightness == Brightness.light ? theme.light() : theme.dark(),
      home: const MyHomePage(title: 'Flutter Laboratorio 2 DM'),
    );
  }
}


