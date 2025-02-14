class RiderModel {
  int id;
  String username;
  String? fullname;
  String phoneNumber;
  String plateNumber;
  String status;
  String dateJoined;
  bool loggedin;

  RiderModel({
    required this.id,
    required this.username,
    this.fullname,
    required this.phoneNumber,
    required this.plateNumber,
    required this.status,
    required this.dateJoined,
    required this.loggedin,
  });

  factory RiderModel.fromJson(Map<String, dynamic> json) {
    return RiderModel(
      id: json['id'],
      username: json['username'],
      fullname: json['fullname'],
      phoneNumber: json['phonenumber'],
      plateNumber: json['platenumber'],
      status: json['status'],
      dateJoined: json['date_joined'],
      loggedin: json['loggedin'],
      // riderCampaign: (json['ridercampaign'] as List<dynamic>?)
      //     ?.map((e) => Campaign.fromJson(e as Map<String, dynamic>))
      //     .toList(),
    );
  }
}

class Campaign {
  Campaign();

  factory Campaign.fromJson(Map<String, dynamic> json) {
    return Campaign();
  }
}

// {refresh:
// eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTczOTQ5MzQyNSwiaWF0IjoxNzM5NDA3MDI1LCJqdGkiOiJkYmZhNWU1OWVjMDc0NjUwOTB
// jMGMxM2YzZTc2NDQ3ZSIsInVzZXJfaWQiOjYsInVzZXJuYW1lIjoiYWJjMTI0a2QiLCJ1c2VyX3R5cGUiOiJSaWRlciJ9.nllCEB_YyzeYItwFpflvjXkzebFxPVmUcnKumdgYAAU, access:
// eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzM5NDA3MzI1LCJpYXQiOjE3Mzk0MDcwMjUsImp0aSI6IjI0N2U0NGRhNDc0ZDQ5MjI5MDR
// jNDMxZTIwYzRmMzQ0IiwidXNlcl9pZCI6NiwidXNlcm5hbWUiOiJhYmMxMjRrZCIsInVzZXJfdHlwZSI6IlJpZGVyIn0.DYwy5ANH2upe4n7KTSJ_AjR_4Q6ULKNU3TEfW_DPTmM, details:
// {rider: {id: 6, username: abc124kd, fullname: null, phonenumber: 2348029429723, platenumber: abc124kd, status: registered, date_joined: 13 Feb 2025
// 12:34AM, loggedin: true}, ridercampaign: {}, campaign: {}}}
