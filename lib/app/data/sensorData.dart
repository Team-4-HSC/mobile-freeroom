import 'dart:convert';

SensorData sensorDataFromJson(String str) =>
    SensorData.fromJson(json.decode(str));

String sensorDataToJson(SensorData data) => json.encode(data.toJson());

class SensorData {
  SensorData({
    required this.state,
    required this.status,
    required this.isWaiting,
  });

  bool state;
  String status;
  bool isWaiting;

  factory SensorData.fromJson(Map<String, dynamic> json) => SensorData(
        state: json["state"],
        status: json["status"],
        isWaiting: json["isWaiting"],
      );

  Map<String, dynamic> toJson() => {
        "state": state,
        "status": status,
        "isWaiting": isWaiting,
      };
}
