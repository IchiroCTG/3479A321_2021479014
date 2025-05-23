import 'package:application_laboratorio3/pages/aboutPage.dart';

import 'package:flutter/material.dart';


class listContentPage extends StatefulWidget {
  const listContentPage({super.key});

  @override
  State<listContentPage> createState() => _listContentPage();
}

class _listContentPage extends State<listContentPage> {
  
  @override
  
  Widget build(BuildContext context) {
  print("ListContent iniciada");
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