import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:udemy_intermediatework/supabase/controller/home_controller.dart';

class AddNoteController extends GetxController {
  final homeC = Get.find<HomeController>();
  RxBool isLoading = false.obs;
  TextEditingController titleC = TextEditingController();
  TextEditingController descC = TextEditingController();

  final client = Supabase.instance.client;

  void addNote() async {
    isLoading.value = true;

    List<Map<String, dynamic>> user = await client
        .from("supabaseUsers")
        .select("id")
        .match({"uid": client.auth.currentUser!.id});

    int id = user.first["id"];

    await client.from("supabaseNotes").insert({
      "user_id": id, //Kita membutuhkan id karena ingin menyamakan data ini untuk suatu user
      "title": titleC.text,
      "desc": descC.text,
      "created_at": DateTime.now().toIso8601String(),
    });

    isLoading.value = false;
    await homeC.getAllNotes(); //Krusial saat add note, harus ada AWAIT!
    Get.back();
  }
}
