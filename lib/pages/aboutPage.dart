import 'package:application_laboratorio3/pages/listContent_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:logger/logger.dart';
import 'package:stateless/stateless.dart';

class aboutPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
      void _prevPage(){
    Navigator.pop(context);
  }
    return Scaffold(
      appBar: AppBar(title: Text('About')),
      persistentFooterButtons: [TextButton(onPressed: _prevPage, child: Text('Regresar'),
      style: TextButton.styleFrom(foregroundColor: Colors.black,backgroundColor: Colors.blue)),
      ],
    );
  }

}