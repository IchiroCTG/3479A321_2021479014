class Actividad {

  String id;
  String fecha;
  String Nombre;
 Actividad({
  required this.id,
  required this.fecha,
  required this.Nombre,
 });
 Map<String, dynamic> toMap() {
    return {
      'id': id,
      'fecha': fecha,
      'Nombre': Nombre,
    };
  }

  factory Actividad.fromMap(Map<String, dynamic> map) {
    return Actividad(
      id: map['id'] ?? '',
      fecha: map['fecha'] ?? '',
      Nombre: map['Nombre'] ?? '',
    );
  }
}