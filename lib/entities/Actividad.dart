class Actividad {

  int? id;
  String fecha;
  String Nombre;
 Actividad({
  this.id,
  required this.fecha,
  required this.Nombre,
 });
 Map<String, dynamic> toMap() {
    final map = <String, dynamic>{
      'fecha': fecha,
      'Nombre': Nombre,
    };
    if (id != null) {
      map['id'] = id;
    }
    return map;
  }

  factory Actividad.fromMap(Map<String, dynamic> map) {
    return Actividad(
      id: map['id'] ?? '',
      fecha: map['fecha'] ?? '',
      Nombre: map['Nombre'] ?? '',
    );
  }
}