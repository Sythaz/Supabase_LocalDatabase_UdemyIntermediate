

















































// HIVE
// part 'db_manager.g.dart';
// @HiveType(typeId: 0)
// class Notes extends HiveObject {
//   @HiveField(0)
//   int? id;

//   @HiveField(1)
//   String? title;

//   @HiveField(2)
//   String? desc;
// }

// class DatabaseManager {
//   static Box<Notes> getAllNote() => Hive.box<Notes>('notes');
// }
















































// Moor / Drift
// import 'package:moor_flutter/moor_flutter.dart';
// part 'db_manager.g.dart'; //Wajib di sertakan secara manual karena jika tidak ada, maka program terminal akan error

// class Notes extends Table {
//   //Penyimpanan data pada kolom menurut tipe datanya masing-masing, jika IntColumn wajib menggunakan integer() dan jika TextColumn menggunakan text()
//   //Fungsi .call() alias () adalah perintah eksekusi sehingga WAJIB di ketik. Gunakan () agar tidak error!
//   IntColumn get id => integer().autoIncrement().nullable()();
//   TextColumn get title => text().withLength(min: 1, max: 100)();
//   TextColumn get desc => text().withLength(min: 1, max: 255)();
// }
// //Setiap kali terdapat perubahan pada Table, maka build_runner build harus dilakukan lagi

// @UseMoor(tables: [
//   Notes
// ]) //Sebagai acuan build_runner bahwa class Notes adalah table yang diinginkan
// class DatabaseManager extends _$DatabaseManager {
//   //extends class g.dart
//   //Class lain membutuhkan sebuah path dan akan dikirim melalui constructor ini
//   //FlutterQueryExecutor.inDatabaseFolder() digunakan untuk menentukan letak penyimpanan database
//   DatabaseManager()
//       : super(FlutterQueryExecutor.inDatabaseFolder(path: 'notes.sqflite'));

//   int get schemaVersion => 1;

//   //CRUD
//   //READ
//   //Untuk read menggunakan select()
//   Future<List<Note>> fetchAllNotes() => select(notes).get();    //Jika menggunakan builder()
//   Stream<List<Note>> streamAllNotes() => select(notes).watch(); //Jika menggunakan streamBuilder()

//   //CREATE
//   //Untuk create menggunakan into()
//   Future<int> addNote(Note note) => into(notes).insert(note);

//   //UPDATE
//   //Untuk update menggunakan update()
//   Future<bool> updateNote(Note note) => update(notes).replace(note);

//   //DELETE
//   //Untuk delete menggunakan delete()
//   Future<int> deleteNote(Note note) => delete(notes).delete(note);
// } 










































//SQFLite
// class DatabaseManager {
//   DatabaseManager._privateConstructor();
//   static final instance = DatabaseManager._privateConstructor();

//   Database? _db;
//   Future<Database> get getterDb async {
//     if (_db == null) {
//       _db = await _initDb();
//       return _db!;
//     } else {
//       return _db!;
//     }
//   }

//   Future _initDb() async {
//     Directory directory = await getApplicationDocumentsDirectory();
//     String path = join(directory.path, 'note.db');

//     return openDatabase(
//       path,
//       version: 1,
//       onCreate: (db, version) async {
//         return await db.execute(
//           '''
//             CREATE TABLE notes (
//             id INTEGER PRIMARY KEY,
//             title TEXT NOT NULL,
//             desc TEXT NOT NULL
//             )
//           ''',
//         );
//       },
//     );
//   }
// }

// class DatabaseManager {
//   DatabaseManager._privateConstructorr();
//   static final DatabaseManager instance =
//       DatabaseManager._privateConstructorr();

//   Database? _db;

//   Future<Database> get getterDb async {
//     if (_db == null) {
//       _db = await _initDb();
//     }
//     return _db!;
//   }

//   Future _initDb() async {
//     Directory documentDirectory = await getApplicationDocumentsDirectory();

//     String path = join(documentDirectory.path,
//         'note.db'); //note.db adalah nama dari Database kita (bebas dinamain)

//     return openDatabase(
//       path,
//       version: 1,
//       onCreate: (db, version) async {
//         return await db.execute(
//           '''
//             CREATE TABLE notes (
//               id INTEGER PRIMARY KEY,
//               title TEXT NOT NULL,
//               desc TEXT NOT NULL
//             )
//           ''',
//         );
//       },
//     );
//   }
// }