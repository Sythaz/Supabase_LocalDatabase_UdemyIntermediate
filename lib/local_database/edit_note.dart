











































// HIVE
// class EditNotePage extends GetView<EditNoteController> {
//   Notes note = Get.arguments;

//   @override
//   Widget build(BuildContext context) {
//     controller.titleC.text = note.title!;
//     controller.descC.text = note.desc!;

//     return Scaffold(
//       appBar: AppBar(
//           title: const Text("Percobaan SQFLite",
//               style: TextStyle(color: Colors.white)),
//           backgroundColor: Colors.blueAccent),
//       body: Column(
//         children: [
//           const Center(
//             child: Text("EDIT"),
//           ),
//           const SizedBox(height: 20),
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
//             onPressed: () async {
//               await controller.editNote(note);
//               Get.back();
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }













































//Moor/Drift
// class EditNotePage extends GetView<EditNoteController> {
//   final HomeController homeController = Get.find();
//   Note note = Get.arguments; //Mengambil data dari halaman sebelumnya

//   @override
//   Widget build(BuildContext context) {
//     controller.titleC.text =
//         note.title; // Replace controller editNoteController dengan argument
//     controller.descC.text = note.desc;
//     return Scaffold(
//       appBar: AppBar(
//           title: const Text("Percobaan SQFLite",
//               style: TextStyle(color: Colors.white)),
//           backgroundColor: Colors.blueAccent),
//       body: Column(
//         children: [
//           const Center(
//             child: Text("EDIT"),
//           ),
//           const SizedBox(height: 20),
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
//           Obx(
//             () => ElevatedButton(
//               onPressed: () {
//                 if (controller.isLoading.isFalse) {
//                   //IsLoading hanya bisa diubah menggunakan .value karena .isTrue/isFalse tidak berefek
//                   controller.isLoading.value = true;
//                   homeController.dataM.updateData(
//                     Note(
//                       //Untuk edit harus menggunakan id, karena id yang menjadi kunci dalam data yang ingin diubah meskipun id tidak required
//                       id: note.id,
//                       title: controller.titleC.text,
//                       desc: controller.descC.text,
//                     ),
//                   );
//                   controller.isLoading.value = false;
//                   Get.back();
//                 }
//               },
//               child: controller.isLoading.isFalse
//                   ? Text("Update")
//                   : Text("Loading..."),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
