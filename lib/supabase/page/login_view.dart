import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udemy_intermediatework/supabase/controller/login_controller.dart';
import 'package:udemy_intermediatework/supabase/route/routes.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            "LOGIN SUPABASE",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blueAccent),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          TextField(
            controller: controller.emailC,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              labelText: "Email",
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 20),
          Obx(
            () {
              return TextField(
                obscureText: controller.isHidden.value,
                controller: controller.passC,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                      onPressed: () => controller.isHidden.toggle(),
                      icon: controller.isHidden.isTrue
                          ? Icon(Icons.remove_red_eye)
                          : Icon(Icons.remove_red_eye_outlined)),
                  labelText: "Password",
                  border: OutlineInputBorder(),
                ),
              );
            },
          ),
          SizedBox(height: 20),
          Obx(
            () {
              return ElevatedButton(
                onPressed: () {
                  if (controller.isLoading.isFalse) {
                    controller.login();
                  }
                },
                child: controller.isLoading.isFalse
                    ? Text('LOGIN')
                    : Text('Loading..'),
              );
            },
          ),
          SizedBox(height: 20),
          TextButton(
              onPressed: () => Get.toNamed(Routes.REGISTER),
              child: Text('REGISTER'))
        ],
      ),
    );
  }
}
