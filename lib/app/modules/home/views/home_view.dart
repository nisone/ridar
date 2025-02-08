import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ridar/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ridar'),
      ),
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 56,
            ),
            CircleAvatar(
              backgroundImage: Image.asset(
                'assets/images/person1.png',
                fit: BoxFit.cover,
              ).image,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              child: Text('+234 706 2885 314'),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
            ),
            ListTile(
              onTap: () {
                Get.offAllNamed(Routes.LOGIN);
              },
              leading: Icon(Icons.logout),
              title: Text('Logout'),
            ),
          ],
        ),
      ),
      body: const Center(
        child: Text(
          'Welcome to Ridar application',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
