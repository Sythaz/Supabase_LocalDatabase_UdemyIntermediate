import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udemy_intermediatework/supabase/route/routes.dart';
import 'package:udemy_intermediatework/supabase/controller/auth_controller.dart';
import 'package:udemy_intermediatework/supabase/controller/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  final authC = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    Get.put(ProfileController());
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "PROFILE SUPABASE",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed(Routes.LOGIN);
              controller.logout();
              authC.reset();
            },
            icon: Icon(Icons.exit_to_app),
            color: Colors.white,
          ),
        ],
      ),
      body: FutureBuilder(
          future: controller.getProfile(),
          builder: (context, snap) {
            if (snap.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snap.hasError) {
              return Center(
                child: Text("Error: ${snap.error}"),
              ); // Error state
            }
            return ListView(
              padding: EdgeInsets.all(20),
              children: [
                TextField(
                  controller: controller.nameC,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    labelText: "Name",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  readOnly: true,
                  controller: controller.emailC,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                Obx(
                  () => TextField(
                    obscureText: controller.isHidden.value,
                    controller: controller.passC,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () => controller.isHidden.toggle(),
                        icon: Icon(controller.isHidden.value
                            ? Icons.visibility
                            : Icons.visibility_off),
                      ),
                      labelText: "New Password",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Obx(
                  () {
                    return ElevatedButton(
                      onPressed: () {
                        if (controller.isLoading.isFalse) {
                          controller.updateProfile();
                        }
                      },
                      child: controller.isLoading.isFalse
                          ? Text('UPDATE PROFILE')
                          : Text('Loading..'),
                    );
                  },
                )
              ],
            );
          }),
    );
  }
}
