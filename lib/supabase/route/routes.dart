// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';
import 'package:udemy_intermediatework/supabase/page/add_note_view.dart';
import 'package:udemy_intermediatework/supabase/page/edit_note_view.dart';
import 'package:udemy_intermediatework/supabase/page/home_view.dart';
import 'package:udemy_intermediatework/supabase/page/login_view.dart';
import 'package:udemy_intermediatework/supabase/page/profile_view.dart';
import 'package:udemy_intermediatework/supabase/page/register_view.dart';

class Routes {
  // Definisi konstanta rute
  static const HOME = '/homePage';
  static const LOGIN = '/loginPage';
  static const REGISTER = '/registerPage';
  static const PROFILE = '/profilePage';
  static const ADD_NOTE = '/addNotePage';
  static const EDIT_NOTE = '/editNotePage';

  // Gunakan konstanta yang benar dalam GetPage
  static final route = [
    GetPage(name: HOME, page: () => HomeView()), // Gunakan konstanta HOME
    GetPage(name: LOGIN, page: () => LoginView()), // Gunakan konstanta LOGIN
    GetPage(
        name: REGISTER,
        page: () => RegisterView()), // Gunakan konstanta REGISTER
    GetPage(name: PROFILE, page: () => ProfileView()),
    GetPage(name: ADD_NOTE, page: () => AddNoteView()),
    GetPage(name: EDIT_NOTE, page: () => EditNoteView())
  ];
}
