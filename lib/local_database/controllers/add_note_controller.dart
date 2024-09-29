












































// HIVE
// class AddNoteController extends GetxController {
//   TextEditingController titleC = TextEditingController();
//   TextEditingController descC = TextEditingController();

//   //Menggunakan Future karena perlu menunggu proses addNote() selesai sehingga dapat Get.back()
//   Future<void> addNote() async {
//     //Karena ini sebuah penambahan data, maka perlu validasi
//     if (titleC.text.isNotEmpty && descC.text.isNotEmpty) {
//       //Proses INSTANSIASI data dari input user
//       Notes note = Notes()
//         ..id = 0
//         ..title = titleC.text
//         ..desc = descC.text;

//       //Setiap ingin melakukan perubahan terhadap data, perlu memanggil getAllNote() pada DB
//       final box = DatabaseManager.getAllNote();

//       //Proses INISIALISASI atau menambah data dengan .add()
//       //Karena fungsi add() return sebuah id unik (auto-increment), maka digunakan sebagai ID
//       int id = await box.add(note);

//       //Edit id dengan id increment otomatis dari box.add
//       note.id = id;
//       // note.save();

//       // titleC.clear();
//       // descC.clear();

//       // await box.put('notess', note); //Menyimpan data seperti map
//       // print('ID: $id');
//       // print(box.toMap()[id]!.id); //Mengeluarkan output
//       // print(box.toMap()[id]!.title); //Mengeluarkan output
//       // print(box.toMap()[id]!.desc); //Mengeluarkan output
//     }
//   }
// }












































//Moor/Drift
// class AddNoteController extends GetxController {
//   TextEditingController titleC = TextEditingController();
//   TextEditingController descC = TextEditingController();
// }

//SQFLite
// class AddNoteController extends GetxController {
//   RxBool isLoading = false.obs;

//   TextEditingController titleC = TextEditingController();
//   TextEditingController descC = TextEditingController();

//   DatabaseManager instance = DatabaseManager.instance;

//   void addNote() async {
//     if (titleC.text.isNotEmpty && descC.text.isNotEmpty) {
//       isLoading.value = true;
//       Database data = await instance.getterDb;
//       await data.insert(
//         'notes',
//         {
//           'title': titleC.text,
//           'desc': descC.text,
//         },
//       );
//       isLoading.value = false;

//       Get.find<HomeController>().getAllNotes();
//       Get.back();

//       titleC.clear();
//       descC.clear();
//     }
//   }
// }

// class AddNoteController extends GetxController {
//   RxBool isLoading = false.obs;
//   DatabaseManager database = DatabaseManager.instance;

//   TextEditingController titleC = TextEditingController();
//   TextEditingController descC = TextEditingController();

//   void addNote() async {
//     if (titleC.text.isNotEmpty && descC.text.isNotEmpty) {
//       isLoading.value = true;
//       Database db = await database.getterDb;
//       await db.insert(
//         'notes',
//         {
//           "title": titleC.text,
//           "desc": descC.text,
//         },
//         conflictAlgorithm: ConflictAlgorithm.replace,
//       );
//       isLoading.value = false;

//       Get.find<HomeController>()
//           .getAllNotes(); //Komponen penting untuk merefresh tampilan UI karena addNote tidak bersentuhan dengan Obx/Obs
//       Get.back();
//     }
//   }
// }
