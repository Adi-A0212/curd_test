// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';
// import '../models/post_model.dart';
//
// class LocalDb {
//   static Database? _db;
//
//   Future<Database> get database async {
//     if (_db != null) return _db!;
//     _db = await _initDb();
//     return _db!;
//   }
//
//   Future<Database> _initDb() async {
//     final path = join(await getDatabasesPath(), 'posts.db');
//     return await openDatabase(path, version: 1, onCreate: (db, version) {
//       db.execute('''
//         CREATE TABLE posts(
//           id INTEGER PRIMARY KEY,
//           username TEXT,
//           imageUrl TEXT,
//           caption TEXT
//         )
//       ''');
//     });
//   }
//
//   Future<void> insertPosts(List<PostModel> posts) async {
//     final db = await database;
//     for (var post in posts) {
//       await db.insert('posts', post.toMap(),
//           conflictAlgorithm: ConflictAlgorithm.replace);
//     }
//   }
//
//   Future<List<PostModel>> getPosts() async {
//     final db = await database;
//     final maps = await db.query('posts');
//     return maps.map((e) => PostModel.fromJson(e)).toList();
//   }
// }
