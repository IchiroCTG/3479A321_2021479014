import 'package:application_laboratorio3/entities/Actividad.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io';


class DatabaseHelper {
  static Database? _database;

  Future<Database> get database async {
    _database ??= await initializeDatabase();
    return _database!;
  }
  Future<void> deleteDatabaseFile() async {
    final path = join(await getDatabasesPath(), 'actividad.db');
    if (await databaseExists(path)) {
      await deleteDatabase(path);
    }
  }
  Future<Database> initializeDatabase() async {
    final path = join(await getDatabasesPath(), 'actividad.db');
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE actividades(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            Nombre TEXT,
            fecha TEXT
          )
        ''');
      },
    );
  }

  Future<List<Actividad>> getActividades() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('actividades');
    return maps.map((map) => Actividad.fromMap(map)).toList();
  }

  Future<int> insertActividad(Actividad actividad) async {
    final db = await database;
    return await db.insert('actividades', actividad.toMap());
  }

  Future<int> updateActividad(Actividad actividad) async {
    final db = await database;
    return await db.update(
      'actividades',
      actividad.toMap(),
      where: 'id = ?',
      whereArgs: [actividad.id],
    );
  }

  Future<int> deleteActividad(String id) async {
    final db = await database;
    return await db.delete('actividades', where: 'id = ?', whereArgs: [id]);
  }
}