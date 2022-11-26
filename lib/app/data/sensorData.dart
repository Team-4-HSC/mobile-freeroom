import 'dart:convert';

SensorData sensorDataFromJson(String str) =>
    SensorData.fromJson(json.decode(str));

String sensorDataToJson(SensorData data) => json.encode(data.toJson());

class SensorData {
  SensorData({
    required this.state,
    required this.status,
  });

  bool state;
  String status;

  factory SensorData.fromJson(Map<String, dynamic> json) => SensorData(
        state: json["state"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "state": state,
        "status": status,
      };
}
