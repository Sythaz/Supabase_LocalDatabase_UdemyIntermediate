import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:udemy_intermediatework/supabase/route/routes.dart';

class RegisterController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isHidden = true.obs;
  TextEditingController nameC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();

  //Memanggil instance dari SUPABASE agar bisa berkomunikasi dengan DB Supabase
  SupabaseClient client = Supabase.instance.client;

  void signup() async {
    //Validasi saat sign-up harus terdapat email dan password
    if (nameC.text.isNotEmpty &&
        emailC.text.isNotEmpty &&
        passC.text.isNotEmpty) {
      isLoading.value = true;

      //Menggunakan try untuk menangani kesalahan seperti gagal sign-up
      try {
        //Proses permintaan registrasi menggunakan SUPABASE dengan mengirimkan data
        //Disimpan dalam res untuk penggunaan data lebih lanjut
        final res = await client.auth.signUp(
          email: emailC.text,
          password: passC.text,
        );

        isLoading.value = false;

        if (res.user != null) {
          print('Sign-up SUKSES COY: ${res.user!.email}');

          //Saat berhasil register, data akan di insert manual ke dalam tabel supabase menggunakan insert
          await client.from("supabaseUsers").insert({
            //nama tabel "supabaseUsers"
            "email": emailC.text, //unique, not null
            "name": nameC.text, //unique, not null
            "created_at": DateTime.now().toIso8601String(), //not null
            "uid": res.user!.id //unique, not null
          });

          //Pop-up dialog saat sign-up berhasil
          await Get.defaultDialog(
            //Tidak bisa klik belakang pop-up
            barrierDismissible: false,
            title: "BERHASIL REGISTER",
            middleText:
                "Kami telah mengirimkan email. Periksa dan konfirmasi email",
            actions: [
              OutlinedButton(
                  onPressed: () {
                    Get.back(); //Menutup pop-up dialog
                    Get.back(); //Kembali ke halaman login
                  },
                  child: Text('OKE'))
            ],
          );
          print('Sign-up successful for user: ${res.user!.email}');
          // Get.back();
          Get.offAllNamed(Routes.HOME);
        } else {
          print('Sign-up gagal');
        }
      } catch (error) {
        isLoading.value = false;
        Get.snackbar("Sign-up Error", error.toString());
        print('Exception during sign-up: $error');
      }
    } else {
      Get.snackbar('Terjadi Kesalahan', 'Email dan password belum terisi.');
    }
  }
}
