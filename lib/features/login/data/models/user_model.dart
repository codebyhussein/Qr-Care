import 'dart:convert';

import 'package:qr_care/features/login/domain/entities/user_entity.dart';

UserModel userFromJson(String str) => UserModel.fromJson(json.decode(str));

String userToJson(UserModel data) => json.encode(data.toJson());

class UserModel extends UserEntity {
  final String? status;
  final String? message;
  final EnteredValues? enteredValues;

  UserModel({
    this.status,
    this.message,
    this.enteredValues,
  }) : super(
          accountId: enteredValues!.accountId,
          nationalId: enteredValues.nationalId,
          userImage: enteredValues.userImage,
          createdAt: enteredValues.createdAt,
          city: enteredValues.city,
          emergencyContact: enteredValues.emergencyContact,
          emergencyName: enteredValues.emergencyName,
          dateOfBirth: enteredValues.dateOfBirth,
          contact: enteredValues.contact,
          gender: enteredValues.gender,
          government: enteredValues.government,
          governmentCenter: enteredValues.governmentCenter,
          governmentCity: enteredValues.governmentCity,
          job: enteredValues.job,
          confirmPassword: enteredValues.confirmPassword,
        );

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        status: json["status"],
        message: json["message"],
        enteredValues: json["entered_values"] == null
            ? null
            : EnteredValues.fromJson(json["entered_values"]),
      );

  UserModel toJson() {
    return UserModel(
      status: status,
      message: message,
      enteredValues: enteredValues,
    );
  }
}

class EnteredValues {
  final int? id;
  final String? accountId;
  final String? nationalId;
  final String? confirmPassword;
  final String? job;
  final String? gender;
  final String? government;
  final String? city;
  final String? governmentCity;
  final String? governmentCenter;
  final String? contact;
  final String? emergencyContact;
  final String? emergencyName;
  final String? userImage;
  final DateTime? dateOfBirth;
  final DateTime? createdAt;

  EnteredValues({
    this.id,
    this.accountId,
    this.nationalId,
    this.confirmPassword,
    this.job,
    this.gender,
    this.government,
    this.city,
    this.governmentCity,
    this.governmentCenter,
    this.contact,
    this.emergencyContact,
    this.emergencyName,
    this.userImage,
    this.dateOfBirth,
    this.createdAt,
  });

  factory EnteredValues.fromJson(Map<String, dynamic> json) => EnteredValues(
        id: json["id"],
        accountId: json["account_id"],
        nationalId: json["national_id"],
        confirmPassword: json["confirm_password"],
        job: json["job"],
        gender: json["gender"],
        government: json["government"],
        city: json["city"],
        governmentCity: json["government_city"],
        governmentCenter: json["government_center"],
        contact: json["contact"],
        emergencyContact: json["emergency_contact"],
        emergencyName: json["emergency_name"],
        userImage: json["user_image"],
        dateOfBirth: json["date_of_birth"] == null
            ? null
            : DateTime.parse(json["date_of_birth"]),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "account_id": accountId,
        "national_id": nationalId,
        "confirm_password": confirmPassword,
        "job": job,
        "gender": gender,
        "government": government,
        "city": city,
        "government_city": governmentCity,
        "government_center": governmentCenter,
        "contact": contact,
        "emergency_contact": emergencyContact,
        "emergency_name": emergencyName,
        "user_image": userImage,
        "date_of_birth": dateOfBirth == null
            ? null
            : "${dateOfBirth!.year.toString().padLeft(4, '0')}-${dateOfBirth!.month.toString().padLeft(2, '0')}-${dateOfBirth!.day.toString().padLeft(2, '0')}",
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
      };
}
