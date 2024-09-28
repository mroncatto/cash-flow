import 'package:cashflow/common/models/cuenta_models/cuenta_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;

  DatabaseHelper._internal();
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDb();
    return _database!;
  }

  Future<Database> _initDb() async {
    String path = join(await getDatabasesPath(), 'cuenta.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE cuenta (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            descripcion TEXT,
            tipo TEXT,
            color TEXT,
            moneda TEXT,
            activo INTEGER DEFAULT 1,
            saldo REAL DEFAULT 0
          )
        ''');
      },
    );
  }

  Future<void> insertCuenta(CuentaModel cuenta) async {
    final db = await database;
    await db.insert('cuenta', cuenta.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> eliminarCuenta(int id) async {
    final db = await database;
    //await db.delete('cuenta', where: 'id = ?', whereArgs: [id]);
    await db.update('cuenta', {'activo': 0}, where: 'id = ?', whereArgs: [id]);
  }

  Future<List<CuentaModel>> getCuentas() async {
    final db = await database;
    List<Map<String, Object?>> result =
        await db.query("cuenta", where: 'activo = ?', whereArgs: [1]);
    List<CuentaModel> cuentas = [];
    for (var row in result) {
      cuentas.add(CuentaModel.fromMap(row));
    }
    return cuentas;
  }

  Future<CuentaModel?> getCuentaById(int id) async {
    final db = await database;
    List<Map<String, Object?>> result =
        await db.query("cuenta", where: 'id = ?', whereArgs: [id]);
    return result.isNotEmpty ? CuentaModel.fromMap(result.first) : null;
  }
}
