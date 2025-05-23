// ignore: file_names

// ignore_for_file: file_names, duplicate_ignore, camel_case_types, use_key_in_widget_constructors, sort_child_properties_last, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';

class aboutPage extends StatefulWidget{
  const aboutPage({super.key});
  @override
  State<aboutPage> createState() => _aboutPage();
}


class _aboutPage extends State<aboutPage>{
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