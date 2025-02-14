import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ridar/app/data/assets.dart';
import 'package:ridar/app/routes/app_pages.dart';

import '../controllers/settings_controller.dart';

class SettingsView extends GetView<SettingsController> {
  SettingsView({super.key});

  final SettingsController _controller = Get.put(SettingsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.colorScheme.tertiaryContainer,
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverList.list(
            children: [
              Padding(
                padding: const EdgeInsets.all(24),
                child: CircleAvatar(
                  backgroundImage: Image.asset(
                    person1,
                  ).image,
                ),
              ),
              Text(
                _controller.app.rider?.value.username ?? '',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: poppins,
                    fontWeight: FontWeight.w400,
                    fontSize: 17),
              ),
              Divider(),
              ListTile(
                onTap: () {},
                leading: Icon(Icons.person_rounded),
                title: Text('Personal info'),
                trailing: Icon(Icons.arrow_forward_ios_rounded),
              ),
              // ListTile(
              //   onTap: () {},
              //   leading: Icon(Icons.safety_check_rounded),
              //   title: Text('Trip safety'),
              //   trailing: Icon(Icons.arrow_forward_ios_rounded),
              // ),
              ListTile(
                onTap: () {},
                leading: Icon(Icons.security_rounded),
                title: Text('Login & security'),
                trailing: Icon(Icons.arrow_forward_ios_rounded),
              ),
              ListTile(
                onTap: () {},
                leading: Icon(Icons.privacy_tip_rounded),
                title: Text('Privacy'),
                trailing: Icon(Icons.arrow_forward_ios_rounded),
              ),
              Divider(),
              Obx(
                () => ListTile(
                  onTap:
                      _controller.isLoading.value ? null : _controller.logout,
                  leading: Icon(Icons.logout_rounded),
                  title: Text('Log out'),
                  trailing: _controller.isLoading.value
                      ? CircularProgressIndicator.adaptive()
                      : Icon(Icons.arrow_forward_ios_rounded),
                ),
              ),
              ListTile(
                onTap: () {},
                leading: Icon(Icons.delete_forever_rounded),
                title: Text('Delete account'),
                trailing: Icon(Icons.arrow_forward_ios_rounded),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
