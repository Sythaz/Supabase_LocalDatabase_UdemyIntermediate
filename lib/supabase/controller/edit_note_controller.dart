import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:udemy_intermediatework/supabase/controller/home_controller.dart';

class EditNoteController extends GetxController {
  HomeController homeC = Get.find<HomeController>();
  RxBool isLoading = false.obs;
  TextEditingController titleC = TextEditingController();
  TextEditingController descC = TextEditingController();

  SupabaseClient client = Supabase.instance.client;

  void editNote(int index) async {
    isLoading.value = true;

    //Tidak perlu menemukan id user karena sudah ada didalam tabel notes, dan kita hanya ingin mengubah title dan desc saja
    await client.from("supabaseNotes").update({
      'title': titleC.text,
      'desc': descC.text,
    }).match({'id': index});

    isLoading.value = false;
    await homeC.getAllNotes();
    Get.back();
  }
}
