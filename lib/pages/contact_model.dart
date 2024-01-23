// To parse this JSON data, do
//
//     final dataResponsModel = dataResponsModelFromJson(jsonString);

import 'dart:convert';

DataResponsModel dataResponsModelFromJson(String str) =>
    DataResponsModel.fromJson(json.decode(str));

String dataResponsModelToJson(DataResponsModel data) =>
    json.encode(data.toJson());

class DataResponsModel {
  String? name;
  String? phonenumber;
  String? email;
  String? docId;
  DataResponsModel({this.name, this.phonenumber, this.email, this.docId});

  factory DataResponsModel.fromJson(Map<String, dynamic> json) =>
      DataResponsModel(
          name: json["name"],
          phonenumber: json["phonenumber"],
          email: json["email"],
          docId: json["docId"]);

  Map<String, dynamic> toJson() => {
        "name": name,
        "docId": docId,
        "phonenumber": phonenumber,
        "email": email,
      };
}
