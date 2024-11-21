import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;

  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'leave_requests.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          '''
          CREATE TABLE leave_requests(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            leaveType TEXT,
            location TEXT,
            reason TEXT,
            dateFrom TEXT,
            dateTo TEXT,
            timeFrom TEXT,
            timeTo TEXT
          )
          '''
        );
      },
    );
  }

  Future<int> insertLeaveRequest(Map<String, dynamic> row) async {
    Database db = await database;
    return await db.insert('leave_requests', row);
  }

  Future<List<Map<String, dynamic>>> getAllRequests() async {
    Database db = await database;
    return await db.query('leave_requests');
  }
}
