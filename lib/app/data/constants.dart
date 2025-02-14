import 'package:flutter/material.dart';
import 'package:ridar/app/routes/app_pages.dart';

final String baseUrl = 'http://ridarng.pythonanywhere.com/api';
final String loginUrl = '$baseUrl/token/';
final String registerUrl = '$baseUrl/riders/';
final String logoutUrl = '$baseUrl/logout/rider/{id}/';

final List<Map<String, dynamic>> defaultNavigationBarItems = const [
  {
    'selectedIcon': Icons.home_rounded,
    'unselectedIcon': Icons.home_outlined,
    'label': 'HOME',
    'route': Routes.HOME,
  },
  {
    'selectedIcon': Icons.campaign_rounded,
    'unselectedIcon': Icons.campaign_outlined,
    'label': 'CAMPAIGNS',
    'route': Routes.CAMPAIGNS
  },
  {
    'selectedIcon': Icons.payments_rounded,
    'unselectedIcon': Icons.payment_outlined,
    'label': 'PAYMENTS',
    'route': Routes.PAYMENTS
  },
  {
    'selectedIcon': Icons.settings_rounded,
    'unselectedIcon': Icons.settings_outlined,
    'label': 'PROFILE',
    'route': Routes.SETTINGS
  },
];

// {
//     "refresh": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczOTQ4NjI1MSwiaWF0IjoxNzM5Mzk5ODUxLCJqdGkiOiI1YjBlYzY0YjA2ZDg0MDBlYmFkYWZlM2RkOGFjMzQ4NSIsInVzZXJfaWQiOjUsInVzZXJuYW1lIjoibmlzb25lIiwidXNlcl90eXBlIjoiUmlkZXIifQ.tTbzwkg7NrHmPCd7_l66l3X7d37pNv_Nb5oXRTs0dlU",
//     "access": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzM5NDAwMTUxLCJpYXQiOjE3MzkzOTk4NTEsImp0aSI6IjFkODFiNDMxNjg1NDRkYmU5MzJhZmM2NmZkNDk5MGZiIiwidXNlcl9pZCI6NSwidXNlcm5hbWUiOiJuaXNvbmUiLCJ1c2VyX3R5cGUiOiJSaWRlciJ9.as83j5yRZxhTKxczJAx2L5llSDZYpRsojzgXAnXvCYs",
//     "details": {
//         "rider": {
//             "id": 5,
//             "username": "nisone",
//             "fullname": null,
//             "phonenumber": "2347062885314",
//             "platenumber": "abc123kd",
//             "status": "registered",
//             "date_joined": "12 Feb 2025 08:36PM",
//             "loggedin": true
//         },
//         "ridercampaign": {},
//         "campaign": {}
//     }
// }
