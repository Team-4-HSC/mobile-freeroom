import 'dart:convert';

UserData userDataFromJson(String str) => UserData.fromJson(json.decode(str));

String userDataToJson(UserData data) => json.encode(data.toJson());

class UserData {
  UserData({
    required this.name,
    required this.typeOfUser,
    required this.major,
    required this.faculty,
  });

  String name;
  String typeOfUser;
  String major;
  String faculty;

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        name: json["name"],
        typeOfUser: json["typeOfUser"],
        major: json["major"],
        faculty: json["faculty"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "typeOfUser": typeOfUser,
        "major": major,
        "faculty": faculty,
      };
}
