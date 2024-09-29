import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:udemy_intermediatework/supabase/assets/models/note_model.dart';

class HomeController extends GetxController {
  RxList allNotes = List<Note>.empty().obs;

  SupabaseClient client = Supabase.instance.client;

  Future<void> getAllNotes() async {
    List<Map<String, dynamic>> user = await client
        .from("supabaseUsers")
        .select('id')
        .match({'uid': client.auth.currentUser!.id});

    int id = user.first['id'];

    List<Map<String, dynamic>> notes = await client // Chaining method
        .from("supabaseNotes")
        .select()
        .match({"user_id": id})
        //Jika tidak menggunakan order, saat data di edit menjadi list teratas (default created_at)
        .order("id", ascending: true);

    allNotes(Note.toJsonList(notes));
    allNotes.refresh();
  }

  void deteleNote(int index) async {
    await client.from("supabaseNotes").delete().match({"id": index});
    await getAllNotes();
  }
}











































//Moor/Drift
// class HomeController extends GetxController {
//   DatabaseManager dataM = DatabaseManager();
// }

//SQFLite
// class HomeController extends GetxController {
//   RxList dataNotes = <Note>[].obs;
//   DatabaseManager data = DatabaseManager.instance;

//   Future getAllNotes() async {
//     Database dataMentah = await data.getterDb;
//     List<Map<String, dynamic>> result = await dataMentah.query('notes');

//     if (result.isNotEmpty) {
//       dataNotes(Note.toJsonList(result));
//       dataNotes.refresh();
//     } else {
//       dataNotes.clear();
//       dataNotes.refresh();
//     }
//   }

//   Future deleteNote(int id) async {
//     Database dataMentah = await data.getterDb;
//     dataMentah.delete('notes', where: 'id = ?', whereArgs: [id]);
//     getAllNotes();
//   }
// }

// class HomeController extends GetxController {
//   RxList dataNotes = <Note>[]
//       .obs; //<Note> untuk lebih aman, data yang diterima hanya berupa objek Note
//   DatabaseManager data = DatabaseManager.instance;

//   Future getAllNotes() async {
//     Database getterDb = await data.getterDb;
//     List<Map<String, dynamic>> result = await getterDb.query('notes');
//     //Tipe data generik (List<Map<String, dynamic>>), yang semula table:
//     /* id	title	  desc
//         1	Note 1	Description 1
//         2	Note 2	Description 2
//     */
//     // Menjadi berikut:
//     /* [
//         {"id": 1, "title": "Note 1", "desc": "Description 1"},
//         {"id": 2, "title": "Note 2", "desc": "Description 2"}
//        ]
//     */

//     if (result.isNotEmpty) {
//       dataNotes(Note.toJsonList(result)); //Karena kita ingin mereplace data lama dengan data baru maka langsung ditimpa, tidak menggunakan add untuk append data baru
//       dataNotes.refresh();
//     }
//   }

// //Get_SharedPreference dan Get_Storage
// //   RxInt data = 0.obs;

// //   // void simpan() async {
// //   //   print('Simpan data');
// //   //   final prefs = await SharedPreferences.getInstance();
// //   //   prefs.setString('name', 'Syafiq');
// //   //   bacaData();
// //   // }

// //   // bacaData() async {
// //   //   print('Baca data');
// //   //   final prefs = await SharedPreferences.getInstance();
// //   //   if (prefs.getString('name') != null) {
// //   //     data.value = prefs.getString('name')!;
// //   //   } else {
// //   //     data.value = 'Tidak ada data!';
// //   //   }
// //   // }

// //   // hapusData() async {
// //   //   print('Hapus data');
// //   //   final prefs = await SharedPreferences.getInstance();
// //   //   prefs.remove('name');
// //   //   bacaData();
// //   // }

// //   bacaDataInt() async {
// //     print('Baca data Int');
// //     final prefs = await SharedPreferences.getInstance();
// //     if (prefs.getInt('counter') != null) {
// //       data.value = prefs.getInt('counter')!;
// //     }
// //   }

// //   tambah() async {
// //     print('Tambah Int');
// //     final prefs = await SharedPreferences.getInstance();
// //     if (prefs.getInt('counter') == null) {
// //       data.value = 1;
// //       prefs.setInt('counter', data.value);
// //     } else if (prefs.getInt('counter') != null) {
// //       data.value = prefs.getInt('counter')! + 1;
// //       prefs.setInt('counter', data.value);
// //     }
// //     bacaDataInt();
// //   }

// //   kurang() async {
// //     print('Kurang Int');
// //     final prefs = await SharedPreferences.getInstance();
// //     if (prefs.getInt('counter') != 0) {
// //       data.value = (prefs.getInt('counter')! - 1);
// //     } else {
// //       data.value = 999;
// //     }
// //     prefs.setInt('counter', data.value);
// //     bacaDataInt();
// //   }

// //   // Perbedaan antara atas dan bawah ----------------------------------------

// //   void decrement() {
// //     data--;
// //     simpanData();
// //   }

// //   void increment() {
// //     data++;
// //     simpanData();
// //   }

// //   void simpanData() async {
// //     final prefs = await SharedPreferences.getInstance();
// //     if (prefs.getInt('angkaTerakhir') != null) {
// //       await prefs.remove('angkaTerakhir');
// //     }
// //     await prefs.setInt('angkTerakhir', data.value);
// //   }

// //   void bacaData() async {
// //     final prefs = await SharedPreferences.getInstance();
// //     if (prefs.getInt('angkaTerakhir') != null) {
// //       data.value = prefs.getInt('angkaTerakhir')!;
// //     }
// //   }

// //   @override
// //   void onInit() {
// //     bacaData();
// //     super.onInit();
// //   }
// }
