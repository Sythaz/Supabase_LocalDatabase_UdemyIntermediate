















































// HIVE
// class EditNoteController extends GetxController {
//   RxBool isLoading = false.obs;
//   TextEditingController titleC = TextEditingController();
//   TextEditingController descC = TextEditingController();

//   Future<void> editNote(Notes note) async {
//     note.title = titleC.text;
//     note.desc = descC.text;

//     //Berguna untuk (listenable?) merefresh tampilan, karena jika tidak menggunakan .save() maka perlu reload manual
//     note.save();
//   }
// }











































//Moor/Drift
// class EditNoteController extends GetxController {
//   RxBool isLoading = false.obs;
//   TextEditingController titleC = TextEditingController();
//   TextEditingController descC = TextEditingController();
// }

//SQFLite
// class EditNoteController extends GetxController {
//   //Mirip dengan AddNoteController namun edit menggunakan .update()
//   RxBool isLoading = false.obs;

//   TextEditingController titleC = TextEditingController();
//   TextEditingController descC = TextEditingController();
//   DatabaseManager instance = DatabaseManager.instance;

//   void editNote(int id) async {
//     Database db = await instance.getterDb;
//     await db.update( //Menggunakan .update()
//       "notes",
//       {
//         "id": id,
//         "title": titleC.text,
//         "desc": descC.text,
//       },
//       where: "id = ?",
//       whereArgs: [id],
//     );
    
//     Get.find<HomeController>().getAllNotes();
//     Get.back();
//   }
// }
