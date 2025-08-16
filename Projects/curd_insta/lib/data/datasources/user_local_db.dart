// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';
// import '../models/user_model.dart';
//
// class UserLocalDb {
//   static Database? _db;
//
//   Future<Database> get database async {
//     if (_db != null) return _db!;
//     _db = await _initDb();
//     return _db!;
//   }
//
//   Future<Database> _initDb() async {
//     final path = join(await getDatabasesPath(), 'user.db');
//     return await openDatabase(path, version: 1, onCreate: (db, version) {
//       db.execute('''
//         CREATE TABLE user(
//           id INTEGER PRIMARY KEY,
//           username TEXT,
//           profileImageUrl TEXT,
//           bio TEXT
//         )
//       ''');
//     });
//   }
//
//   Future<void> saveUser(UserModel user) async {
//     final db = await database;
//     await db.insert('user', user.toMap(),
//         conflictAlgorithm: ConflictAlgorithm.replace);
//   }
//
//   Future<UserModel?> getUser() async {
//     final db = await database;
//     final maps = await db.query('user');
//     if (maps.isNotEmpty) {
//       return UserModel.fromJson(maps.first);
//     }
//     return null;
//   }
// }
