
import 'package:flutter/material.dart';




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