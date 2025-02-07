import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Ridar",
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.SIGNUP, // AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xAA6A1B9A),
        ),
      ),
    ),
  );
}
