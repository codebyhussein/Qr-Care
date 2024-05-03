import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppConst {
  static const idPattern = r'^\d{14}$';
  // static String passwordPattern =
  //     r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  static String passwordPattern = r'^[0-9]*$';

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

  static List<String> jops = [
    'Doctor',
    'Administrative Services',
    'Build Operate Maintain (Plant Operations)',
    'Business Services',
    'Commercial Management',
    'Communications',
    'Continuous Improvement',
    'Digital, Technology and Data (DT&D)',
    'Environmental Health and Safety',
    'Executive / Commercial Management',
    'Finance',
    'Financial Markets',
    'Food Safety Quality & Regulatory',
    'General Affairs',
    'Human Resources',
    'Information Services',
    'Law',
    'Marketing',
    'Office Services',
    'Project Management',
    'Records & Information Management',
    'Research & Development',
    'Sales',
    'Security',
    'Strategic Sourcing / Procurement',
    'Strategy & Business Development',
    'Supply Chain',
    'Supply Chain Management',
    'Supply Chain Planning',
    'Sustainability',
    'Trade Execution',
    'Trading',
    'Transportation & Logistics',
    "Other"
  ];

  static List<Map<String, dynamic>> data = [
    {
      "id": "30205101324567",
      "name": "Mohamed ali",
      "emrgancy_number": "01277532063",
      "height": 170.0,
      "weight": 60.0,
      "blood_type": "A+",
      "boold_suger": "Not Known",
      "Allergies": "Found",
      "Type_of_allergy": "Autoallergy",
      "chronic_disease": "Not Found",
      "x_ray_image": "assets/images/not-found.jpg",
      "medical_analysis": "Not Known",
      "data_of_birth": "20/9/2002",
      "jop": "doctor",
      "phone_number": "+481234567890",
      "national_id": "30528632504",
      "link": "https://qr-link-eta.vercel.app/",
    },
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
    DateTime birthDateTime = DateTime.parse(birthDate);
    DateTime currentDateTime = DateTime.now();
    int age = currentDateTime.year - birthDateTime.year;
    int month1 = currentDateTime.month;
    int month2 = birthDateTime.month;
    if (month2 > month1) {
      age--;
    } else if (month1 == month2) {
      int day1 = currentDateTime.day;
      int day2 = birthDateTime.day;
      if (day2 > day1) {
        age--;
      }
    }
    return age;
  }
}
