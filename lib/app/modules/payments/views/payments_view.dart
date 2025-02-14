import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ridar/app/data/assets.dart';

import '../controllers/payments_controller.dart';

class PaymentsView extends GetView<PaymentsController> {
  const PaymentsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.colorScheme.tertiaryContainer,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Payments',
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
                    title: Text('Payment 1'),
                    subtitle: Text('11 Nov, 13:27, N900, 52 (Km)'),
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
