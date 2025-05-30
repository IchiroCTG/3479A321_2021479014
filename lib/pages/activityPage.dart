import 'package:application_laboratorio3/entities/Actividad.dart';
import 'package:application_laboratorio3/services/dataBaseHelper.dart';

import 'package:flutter/material.dart';


class activityPage extends StatefulWidget {
  const activityPage({super.key});

  @override
  State<activityPage> createState() => _activityPage();
}

class _activityPage extends State<activityPage> {
  final DatabaseHelper _dbHelper = DatabaseHelper(); 
  List<Actividad> _actividades = []; 

 Future<void> _loadActividades() async {
    List<Actividad> actividades = await _dbHelper.getActividades();
    setState(() {
      _actividades = actividades;
    });
  }
  Future<void> _insertActividad(Actividad actividad) async {
    await _dbHelper.insertActividad(actividad);
    _loadActividades(); // Refresh the list after insertion
  }
  Future<void> _updateActividad(Actividad actividad) async {
    await _dbHelper.updateActividad(actividad);
    _loadActividades(); // Refresh the list after update
  }
  Future<void> _deleteActividad(String id) async {
    await _dbHelper.deleteActividad(id);
    _loadActividades(); // Refresh the list after deletion
  }

  @override
  void initState() {
    super.initState();
    _loadActividades();
  }
  
  @override
  
  Widget build(BuildContext context) {
  print("ActivityPage iniciada");

    return Scaffold(
      appBar: AppBar(title: Text('List Activity')),
      body: ListView.builder(
        itemCount: _actividades.length,
        itemBuilder: (context,index){
          return ListTile(
            title: Text(_actividades[index].Nombre),
          );
        }
        
      ),
      persistentFooterButtons: [
        TextButton(
          onPressed: () {
            _insertActividad(Actividad(
              Nombre: 'Actividad ${_actividades.length + 1}',
              fecha: '${DateTime.now().toIso8601String()}',
            ));
          }, 
          child: Text('Agregar'),
          style: TextButton.styleFrom(foregroundColor: Colors.black, backgroundColor: Colors.red)
        ),
                TextButton(
          onPressed: () {
            _updateActividad(Actividad(
              
              Nombre: 'Actividad ${_actividades.length + 1}',
              fecha: '${DateTime.now().toIso8601String()}',
            ));
          }, 
          child: Text('Editar'),
          style: TextButton.styleFrom(foregroundColor: Colors.black, backgroundColor: Colors.red)
        ),
                TextButton(
          onPressed: () {
            _deleteActividad(" ${_actividades.length}"); // Assuming you want to delete the last activity
          }, 
          child: Text('Eliminar'),
          style: TextButton.styleFrom(foregroundColor: Colors.black, backgroundColor: Colors.red)
        )
        
      ],

      
    );
  }

}