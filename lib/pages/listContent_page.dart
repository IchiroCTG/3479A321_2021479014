import 'package:application_laboratorio3/pages/aboutPage.dart';
import 'package:application_laboratorio3/pages/myhomepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:logger/logger.dart';
import 'package:stateless/stateless.dart';

class listContentPage extends StatelessWidget{
  
  @override
  Widget build(BuildContext context) {
  List<String> list = ['Anuncios','Imagenes','Fracciones',' Titulos'];

  void _nextPage(){
      Navigator.push(context, MaterialPageRoute(builder: (context) => aboutPage()));
  }
  void _prevPage(){
    Navigator.pop(context);
  }

    return Scaffold(
      appBar: AppBar(title: Text('List Content')),
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context,index){
          return ListTile(
            title: Text(list[index]),
          );
        }

      ),
      persistentFooterButtons: [TextButton(onPressed: _prevPage, child: Text('Regresar'),
      style: TextButton.styleFrom(foregroundColor: Colors.black,backgroundColor: Colors.blue)),
      TextButton(onPressed: _nextPage, child: Text('Siguiente'),
      style: TextButton.styleFrom(foregroundColor: Colors.black,backgroundColor: Colors.red))],

      
    );
  }

}