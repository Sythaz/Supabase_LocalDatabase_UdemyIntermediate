import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udemy_intermediatework/supabase/route/routes.dart';
import 'package:udemy_intermediatework/supabase/assets/models/note_model.dart';
import 'package:udemy_intermediatework/supabase/controller/auth_controller.dart';
import 'package:udemy_intermediatework/supabase/controller/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final authC = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "HOME",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed(Routes.PROFILE);
            },
            icon: Icon(Icons.person),
            color: Colors.white,
          )
        ],
      ),
      body: FutureBuilder(
          future: controller.getAllNotes(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (controller.allNotes.isEmpty) {
              return Center(
                child: Text("Tidak ada data"),
              );
            }
            return Obx(() {
              return ListView.builder(
                itemCount: controller.allNotes.length,
                itemBuilder: (context, index) {
                  Note note = controller.allNotes[index];
                  return ListTile(
                    leading: CircleAvatar(
                      child: Text("${note.id}"),
                    ),
                    title: Text("Judul ${note.title}"),
                    subtitle: Text("Deskripsi ${note.desc}"),
                    trailing: IconButton(
                        onPressed: () => controller.deteleNote(note.id!),
                        icon: Icon(Icons.delete)),
                    onTap: () {
                      Get.toNamed(
                        Routes.EDIT_NOTE,
                        arguments: note,
                      );
                    },
                  );
                },
              );
            });
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(Routes.ADD_NOTE);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
