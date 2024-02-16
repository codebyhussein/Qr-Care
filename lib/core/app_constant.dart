import 'package:flutter/material.dart';

class AppConst {
  static const String logo_Path = 'assets/svg/logo.svg';
  static const String logo_Path_register = 'assets/svg/LOGO 1.svg';
  static const String female = 'assets/images/female photo.png';
  static const String image = 'assets/images/Image.png';
  static const String parentImage = 'assets/images/parent.png';
  static const String nonParentImage = 'assets/images/non_parent.png';
  static const String male = 'assets/images/male photo.png';
  static const String logo_background_path =
      'assets/images/logo_background.png';

  static const idPattern = r'^\d{14}$';
  static String passwordPattern =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';

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
      "id": "j8TkZwHx7pFQa6R3LY1EoI9GnC",
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
}
