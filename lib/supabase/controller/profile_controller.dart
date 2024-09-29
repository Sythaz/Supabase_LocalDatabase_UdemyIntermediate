import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:udemy_intermediatework/supabase/route/routes.dart';
import 'package:udemy_intermediatework/supabase/controller/auth_controller.dart';

class ProfileController extends GetxController {
  final authC = Get.find<AuthController>();
  RxBool isLoading = false.obs;
  RxBool isHidden = true.obs;
  TextEditingController nameC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();

  var client = Supabase.instance.client;

  Future<void> getProfile() async {
    final res = await client //Menggunakan chaining method
        .from("supabaseUsers")
        .select('name, email')
        .match({'uid': '${client.auth.currentUser!.id}'});

    // Mendapatkan data user yang berupa tipedata Map
    // Menggunakan as sebenarnya opsional karena hanya untuk keamanan tipedata berlapis yang harusnya dibarengi try-catch
    Map<String, dynamic> user = res.first as Map<String, dynamic>;

    nameC.text = user['name'];
    emailC.text = user['email'];
  }

  void updateProfile() async {
    isLoading.value = true;
    bool isNameChanged = false;
    bool isPassChanged = false;

    if (nameC.text.isNotEmpty) {
      await client //Chaining method
          .from('supabaseUsers')
          .update({'name': nameC.text}) //Menggunakan fungsi update
          //Tidak lupa menggunakan match agar data user lain tidak terubah juga
          .match({'uid': '${client.auth.currentUser!.id}'});

      isNameChanged = true;
    }

    if (passC.text.isNotEmpty) {
      if (passC.text.length > 5) {
        try {
          final cekPass = await client.auth.signInWithPassword(
            email: emailC.text,
            password: passC.text,
          );

          if (cekPass.session != null) {
            Get.snackbar('Terjadi kesalahan', 'Password sudah digunakan');
          }
        } catch (e) {
          await client.auth.updateUser(
            UserAttributes(password: passC.text),
          );
          isPassChanged = true;
        }
      } else {
        Get.snackbar('Terjadi kesalahan', 'Password minimal 6 karakter');
      }
    }

    isLoading.value = false;
    if (isNameChanged || isPassChanged) {
      if (isPassChanged) {
        Get.toNamed(Routes.LOGIN);
        authC.reset();
      } else {
        Get.back();
      }
    }
  }

  Future<void> logout() async {
    // Memindahkan .logout() karena tombol logout berada di profile
    await client.auth.signOut();
    Get.offAllNamed(Routes.LOGIN);
    Get.snackbar('Berhasil Log-Out', 'Anda telah keluar dari akun');
  }
}
