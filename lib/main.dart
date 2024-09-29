import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:udemy_intermediatework/supabase/route/routes.dart';
import 'package:udemy_intermediatework/supabase/controller/auth_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Supabase supabase = await Supabase.initialize(
    url: 'https://bnbkagmxvyzeaatgwtfv.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJuYmthZ214dnl6ZWFhdGd3dGZ2Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjYxMjUwNTgsImV4cCI6MjA0MTcwMTA1OH0.fGvJuUNkbuqWlJwhneU43e2poLCtxlhLZbZV3xiDnsg',
  );

  print('ADAKAH USER? : ${supabase.client.auth.currentUser}');
  
  Get.put(AuthController());

  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    title: "SUPABASE",
    initialRoute:
        supabase.client.auth.currentUser == null ? Routes.LOGIN : Routes.HOME,
    getPages: Routes.route,
  ));
}
