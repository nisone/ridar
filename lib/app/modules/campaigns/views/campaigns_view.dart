import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ridar/app/data/assets.dart';

import '../controllers/campaigns_controller.dart';

class CampaignsView extends GetView<CampaignsController> {
  const CampaignsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.colorScheme.tertiaryContainer,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'My Campaigns',
              style: TextStyle(
                  fontFamily: poppins,
                  fontWeight: FontWeight.w600,
                  fontSize: 17),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                spacing: 6,
                children: [
                  ListTile(
                    leading: Icon(Icons.campaign_rounded),
                    title: Text('Test Campaing 1'),
                    subtitle: Text('11 Nov, 13:27, N900, 52 (Km)'),
                    trailing: Icon(Icons.arrow_forward_ios_rounded),
                  ),
                  ListTile(
                    leading: Icon(Icons.campaign_rounded),
                    title: Text('Test Campaing 2'),
                    subtitle: Text('16 Dec, 14:27, N500, 45 (Km)'),
                    trailing: Icon(Icons.arrow_forward_ios_rounded),
                  ),
                  ListTile(
                    leading: Icon(Icons.campaign_rounded),
                    title: Text('Test Campaing 3'),
                    subtitle: Text('02 Feb, 12:27, N400, 32 (Km)'),
                    trailing: Icon(Icons.arrow_forward_ios_rounded),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
