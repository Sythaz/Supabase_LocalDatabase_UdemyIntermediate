import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:udemy_intermediatework/supabase/route/routes.dart';
import 'package:udemy_intermediatework/supabase/controller/auth_controller.dart';

class LoginController extends GetxController {
  final authC = Get.find<AuthController>();
  RxBool isLoading = false.obs;
  RxBool isHidden = true.obs;
  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();

  SupabaseClient client = Supabase.instance.client;

  void login() async {
    if (emailC.text.isNotEmpty && passC.text.isNotEmpty) {
      isLoading.value = true;
      try {
        final res = await client.auth.signInWithPassword(
          email: emailC.text,
          password: passC.text,
        );

        if (res.user != null) {
          print('Log-in SUKSES COY: ${res.user!.email}');
          Get.offAllNamed(Routes.HOME);
          authC
              .autoLogout(); //otomatis memanggil autoLogout saat melakukan login

          Get.snackbar('Berhasil Log-In', 'Yeeeeyyyy');
        } else {
          print('Log-in gagal');
        }
        isLoading.value = false;
      } catch (e) {
        print('GAGAL LOGIN: $e');
        isLoading.value = false;
      }
    } else {
      Get.snackbar('Terjadi kesalahan', 'Email dan password belum terisi');
    }
  }
}
