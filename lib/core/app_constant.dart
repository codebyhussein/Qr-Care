import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppConst {
  static const idPattern = r'^\d{14}$';
  // static String passwordPattern =
  //     r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  // static String passwordPattern = r'^[0-9]*$';
  static String passwordPattern = r'^[A-Za-z0-9]*$';

  static String phonePattern = r"^01[0125][0-9]{8}";

  static const governoratePattern = r'^\d{3}$';

  static List<String> cities = [
    "Cairo",
    "Giza",
    "Luxor",
    "Alexandria",
    "Port Said",
    "Suez",
    "Ismailia",
    "Mansoura",
    "Tanta",
    "Damietta",
    "Shibin al-Kawm",
    "Qena",
    "Aswan",
    "Hurghada",
    "Bani Suwayf",
    "Marsa Matruh",
    "Sohag",
    "Qalyubia",
    "Al Minya",
    "Al Fayyum",
    "Al Mahalla al-Kubra",
    "Al Mansoura",
    "Al Minufiyya",
  ];

  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showMessage(
      {required String msg, required BuildContext context}) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          msg,
          style: TextStyle(
            color: Colors.white,
            fontSize: 12.sp,
            fontFamily: 'Montserrat meduim',
          ),
        ),
        backgroundColor: Colors.black,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  static int calculateAge(String birthDate) {
    DateTime currentDate = DateTime.now();
    List<String> birthDateParts = birthDate.split('-');
    int day = int.parse(birthDateParts[0]);
    int month = int.parse(birthDateParts[1]);
    int year = int.parse(birthDateParts[2]);
    DateTime birthDateTime = DateTime(year, month, day);
    int age = currentDate.year - birthDateTime.year;
    int month1 = currentDate.month;
    int month2 = birthDateTime.month;
    if (month2 > month1) {
      age--;
    } else if (month1 == month2) {
      int day1 = currentDate.day;
      int day2 = birthDateTime.day;
      if (day2 > day1) {
        age--;
      }
    }
    return age;
  }
}
