import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udemy_intermediatework/supabase/assets/models/note_model.dart';
import 'package:udemy_intermediatework/supabase/controller/edit_note_controller.dart';

class EditNoteView extends GetView<EditNoteController> {
  Note note = Get.arguments;

  EditNoteView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(EditNoteController());
    controller.titleC.text = note.title!;
    controller.descC.text = note.desc!;

    return Scaffold(
      appBar: AppBar(
          title: const Text(
            "EDIT NOTE SUPABASE",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blueAccent),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          TextField(
            controller: controller.titleC,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              labelText: "Judul",
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 20),
          TextField(
            controller: controller.descC,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              labelText: "Deskripsi",
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 20),
          Obx(
            () => ElevatedButton(
              onPressed: () {
                controller.editNote(note.id!);
              },
              child: controller.isLoading.value
                  ? Text("Loading...")
                  : Text("Edit Note"),
            ),
          ),
        ],
      ),
    );
  }
}
