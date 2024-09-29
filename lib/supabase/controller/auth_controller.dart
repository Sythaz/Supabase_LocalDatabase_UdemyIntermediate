import 'dart:async';

import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:udemy_intermediatework/supabase/route/routes.dart';

class AuthController extends GetxController {
  Timer? authTimer;
  SupabaseClient client = Supabase.instance.client;

  //Karena supabase akan autoLogout selama 3600sec maka akan kita atur dengan manual
  Future<void> autoLogout() async {
    //Jika authTimer ada isinya, maka akan di cancel() dan buat authTimer baru.
    if (authTimer != null) {
      authTimer?.cancel();
    }

    authTimer = Timer(
      Duration(seconds: 3600),
      () async {
        await client.auth.signOut();
        Get.offAllNamed(Routes
            .LOGIN); //Saat auto logout akan langsung diarahkan ke LOGIN page
        Get.snackbar('Session TimeOut',
            'Anda telah autoLogout dari akun pada sesi ini.');
      },
    );
  }

  //Saat logout menggunakan tombol maka harus reset authTimer dan menjadikannya null untuk menghindari logout yang tidak diinginkan
  void reset() {
    if (authTimer != null) {
      authTimer?.cancel();
      authTimer = null;
    }
  }
}
