











































// HIVE
// class AddNotePage extends GetView<AddNoteController> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           title: const Text("Percobaan SQFLite",
//               style: TextStyle(color: Colors.white)),
//           backgroundColor: Colors.blueAccent),
//       body: Column(
//         children: [
//           SizedBox(height: 20),
//           TextField(
//             controller: controller.titleC,
//             decoration: InputDecoration(
//               border: OutlineInputBorder(),
//               labelText: 'Judul',
//             ),
//           ),
//           SizedBox(height: 20),
//           TextField(
//             controller: controller.descC,
//             decoration: InputDecoration(
//               border: OutlineInputBorder(),
//               labelText: 'Deskripsi',
//             ),
//           ),
//           SizedBox(height: 20),
//           ElevatedButton(
//             child: Text('Kirim'),
//             onPressed: () async { //Menunggu data di proses lalu bisa kembali menggunakan async dan future pada addNote()
//               await controller.addNote();
//               Get.back();
//             },
//           )
//         ],
//       ),
//     );
//   }
// }










































// Moor / Drift
// class AddNotePage extends GetView<AddNoteController> {
//   final HomeController homeC = Get.find();
//   RxBool isLoading = false.obs;

//   @override
//   Widget build(BuildContext context) {
//     Get.put(DatabaseManager());
//     return Scaffold(
//       appBar: AppBar(
//           title: const Text("Percobaan SQFLite",
//               style: TextStyle(color: Colors.white)),
//           backgroundColor: Colors.blueAccent),
//       body: Column(
//         children: [
//           SizedBox(height: 20),
//           TextField(
//             controller: controller.titleC,
//             decoration: InputDecoration(
//               border: OutlineInputBorder(),
//               labelText: 'Judul',
//             ),
//           ),
//           SizedBox(height: 20),
//           TextField(
//             controller: controller.descC,
//             decoration: InputDecoration(
//               border: OutlineInputBorder(),
//               labelText: 'Deskripsi',
//             ),
//           ),
//           SizedBox(height: 20),
//           Obx(() => ElevatedButton(
//                 onPressed: () {
//                   if (isLoading.isFalse) {
//                     isLoading.value = true;
//                     homeC.dataM.addNote(
//                       Note(
//                         title: controller.titleC.text,
//                         desc: controller.descC.text,
//                       ),
//                     );
//                     controller.titleC.clear();
//                     controller.descC.clear();

//                     isLoading.value = false;
//                     Get.back();
//                   }
//                 },
//                 child: isLoading.isFalse ? Text("Kirim") : Text("Loading..."),
//               ))
//         ],
//       ),
//     );
//   }
// }










































// class AddNote extends GetView<AddNoteController> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text("Add Note"),
//         ),
//         body: ListView(
//           padding: EdgeInsets.all(20),
//           children: [
//             TextField(
//               controller: controller.titleC,
//               decoration: InputDecoration(
//                   labelText: "Tittle", border: OutlineInputBorder()),
//             ),
//             SizedBox(height: 20),
//             TextField(
//               controller: controller.descC,
//               decoration: InputDecoration(
//                   labelText: "Description", border: OutlineInputBorder()),
//             ),
//             SizedBox(height: 20),
//             Obx(
//               () => ElevatedButton(
//                 onPressed: () => {
//                   if (controller.isLoading.isFalse) {controller.addNote()}
//                 },
//                 child:
//                     Text(controller.isLoading.isFalse ? "ADD" : "Loading..."),
//               ),
//             )
//           ],
//         ));
//   }
// }
