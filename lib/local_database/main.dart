












































//HIVE
// void main() async {
//   await Hive.initFlutter();
//   Hive.registerAdapter(NotesAdapter());
//   await Hive.openBox<Notes>('notes');

//   runApp(MainApp());
// }

// class MainApp extends GetView<HomeController> {
//   @override
//   Widget build(BuildContext context) {
//     Get.put(HomeController());
//     Get.put(AddNoteController());
//     Get.put(EditNoteController());

//     return GetMaterialApp(
//       getPages: [
//         GetPage(
//           name: '/home',
//           page: () => MainApp(),
//         ),
//         GetPage(
//           name: '/addNote',
//           page: () => AddNotePage(),
//         ),
//         GetPage(
//           name: '/editNote',
//           page: () => EditNotePage(),
//         )
//       ],
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//             title: const Text(
//               "Percobaan Hive",
//               style: TextStyle(color: Colors.white),
//             ),
//             backgroundColor: Colors.blueAccent),
//         body: ValueListenableBuilder<Box<Notes>>(
//           valueListenable: DatabaseManager.getAllNote().listenable(),
//           builder: (context, box, child) {
//             List<Notes> allNotes = box.values.toList().cast<Notes>();
//             if (allNotes.isEmpty || allNotes == 0) {
//               return Center(
//                 child: Text('Tidak ada data'),
//               );
//             } else {
//               return ListView.builder(
//                 itemCount: box.length,
//                 itemBuilder: (context, index) {
//                   Notes note = allNotes[index];
//                   return ListTile(
//                     onTap: () => Get.toNamed('/editNote', arguments: note),
//                     leading: Text('${note.id}'),
//                     title: Text('${note.title}'),
//                     subtitle: Text('${note.desc}'),
//                     trailing: IconButton(
//                       icon: Icon(Icons.delete),
//                       onPressed: () async => await note.delete(),
//                     ),
//                   );
//                 },
//               );
//             }
//           },
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () => Get.toNamed('/addNote'),
//           child: Icon(Icons.add),
//         ),
//       ),
//     );
//   }
// }










































// Drift/Moor
// class MainApp extends GetView<HomeController> {
//   @override
//   Widget build(BuildContext context) {
//     Get.put(HomeController());
//     Get.put(EditNoteController());
//     Get.put(AddNoteController());

//     return GetMaterialApp(
//       getPages: [
//         GetPage(
//           name: '/home',
//           page: () => MainApp(),
//         ),
//         GetPage(
//           name: '/addNote',
//           page: () => AddNotePage(),
//         ),
//         GetPage(
//           name: '/editNote',
//           page: () => EditNotePage(),
//         )
//       ],
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//             title: const Text("Percobaan Moor / Drift",
//                 style: TextStyle(color: Colors.white)),
//             backgroundColor: Colors.blueAccent),
//         body: StreamBuilder(
//           stream: controller.dataM.streamAllNotes(),
//           builder: (context, snapshot) {
//             if (!snapshot.hasData ||
//                 snapshot.data == null ||
//                 snapshot.data!.isEmpty) {
//               return Center(child: Text("Tidak ada data!"));
//             } else {
//               return ListView.builder(
//                 itemCount: snapshot.data!.length,
//                 itemBuilder: (context, index) {
//                   Note note = snapshot.data![index];
//                   return ListTile(
//                     onTap: () {
//                       Get.toNamed(
//                         'editNote',
//                         //Jika ingin mengirim lebih dari 1 argument bisa menggunakan {}
//                         arguments: note,
//                       );
//                     },
//                     leading: Text("${note.id}"),
//                     title: Text("${note.title}"),
//                     subtitle: Text("${note.desc}"),
//                     trailing: IconButton(
//                       onPressed: () => controller.dataM.deleteNote(note),
//                       icon: Icon(Icons.delete),
//                     ),
//                   );
//                 },
//               );
//             }
//           },
//         ),
//         floatingActionButton: FloatingActionButton.small(
//           onPressed: () => Get.toNamed('/addNote'),
//           child: Icon(Icons.add),
//         ),
//       ),
//     );
//   }
// }









































// class MainApp extends GetView<HomeController> {
//   const MainApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     Get.put(HomeController());
//     Get.put(AddNoteController());
//     return GetMaterialApp(
//       getPages: [
//         GetPage(
//           name: '/main',
//           page: () => const MainApp(),
//         ),
//         GetPage(name: '/add', page: () => AddNote()),
//       ],
//       home: Scaffold(
//         body: Obx(
//           () => controller.dataNotes.length == 0
//               ? Center(
//                   child: Text("Tidak ada data!"),
//                 )
//               : ListView.builder(
//                   itemCount: controller.dataNotes.length,
//                   itemBuilder: (context, index) {
//                     Note noteIndex = controller.dataNotes[index];
//                     return ListTile(
//                       leading: CircleAvatar(
//                         child: Text('${noteIndex.id}'),
//                       ),
//                       title: Text("Judul ${noteIndex.title}"),
//                       subtitle: Text("Deskripsi ${noteIndex.desc}"),
//                     );
//                   },
//                 ),
//         ),
//         floatingActionButton: FloatingActionButton.small(
//           onPressed: () => Get.toNamed('/add'),
//           child: Icon(Icons.add),
//         ),
//       ),
//     );
//   }
// }
