class PersonalModel {
  PersonalModel({
      this.status, 
      this.data,});

  PersonalModel.fromJson(dynamic json) {
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? status;
  Data? data;
PersonalModel copyWith({  String? status,
  Data? data,
}) => PersonalModel(  status: status ?? this.status,
  data: data ?? this.data,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

class Data {
  Data({
      this.user, 
      this.medicalAnalysis, 
      this.medicalTests, 
      this.userAllergies, 
      this.userDiseases, 
      this.userConscriptionStatus,});

  Data.fromJson(dynamic json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    if (json['medical_analysis'] != null) {
      medicalAnalysis = [];
      json['medical_analysis'].forEach((v) {
        medicalAnalysis?.add(MedicalAnalysis.fromJson(v));
      });
    }
    if (json['medical_tests'] != null) {
      medicalTests = [];
      json['medical_tests'].forEach((v) {
        medicalTests?.add(MedicalTests.fromJson(v));
      });
    }
    if (json['user_allergies'] != null) {
      userAllergies = [];
      json['user_allergies'].forEach((v) {
        userAllergies?.add(UserAllergies.fromJson(v));
      });
    }
    if (json['user_diseases'] != null) {
      userDiseases = [];
      json['user_diseases'].forEach((v) {
        userDiseases?.add(UserDiseases.fromJson(v));
      });
    }
    if (json['user_conscription_status'] != null) {
      userConscriptionStatus = [];
      json['user_conscription_status'].forEach((v) {
        userConscriptionStatus?.add(UserConscriptionStatus.fromJson(v));
      });
    }
  }
  User? user;
  List<MedicalAnalysis>? medicalAnalysis;
  List<MedicalTests>? medicalTests;
  List<UserAllergies>? userAllergies;
  List<UserDiseases>? userDiseases;
  List<UserConscriptionStatus>? userConscriptionStatus;
Data copyWith({  User? user,
  List<MedicalAnalysis>? medicalAnalysis,
  List<MedicalTests>? medicalTests,
  List<UserAllergies>? userAllergies,
  List<UserDiseases>? userDiseases,
  List<UserConscriptionStatus>? userConscriptionStatus,
}) => Data(  user: user ?? this.user,
  medicalAnalysis: medicalAnalysis ?? this.medicalAnalysis,
  medicalTests: medicalTests ?? this.medicalTests,
  userAllergies: userAllergies ?? this.userAllergies,
  userDiseases: userDiseases ?? this.userDiseases,
  userConscriptionStatus: userConscriptionStatus ?? this.userConscriptionStatus,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (user != null) {
      map['user'] = user?.toJson();
    }
    if (medicalAnalysis != null) {
      map['medical_analysis'] = medicalAnalysis?.map((v) => v.toJson()).toList();
    }
    if (medicalTests != null) {
      map['medical_tests'] = medicalTests?.map((v) => v.toJson()).toList();
    }
    if (userAllergies != null) {
      map['user_allergies'] = userAllergies?.map((v) => v.toJson()).toList();
    }
    if (userDiseases != null) {
      map['user_diseases'] = userDiseases?.map((v) => v.toJson()).toList();
    }
    if (userConscriptionStatus != null) {
      map['user_conscription_status'] = userConscriptionStatus?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class UserConscriptionStatus {
  UserConscriptionStatus({
      this.id, 
      this.nationalId, 
      this.conscriptionStatus, 
      this.exemptionReason, 
      this.serviceStartDate, 
      this.serviceEndDate, 
      this.notes, 
      this.createdAt,});

  UserConscriptionStatus.fromJson(dynamic json) {
    id = json['id'];
    nationalId = json['national_id'];
    conscriptionStatus = json['conscription_status'];
    exemptionReason = json['exemption_reason'];
    serviceStartDate = json['service_start_date'];
    serviceEndDate = json['service_end_date'];
    notes = json['notes'];
    createdAt = json['created_at'];
  }
  String? id;
  String? nationalId;
  String? conscriptionStatus;
  String? exemptionReason;
  dynamic serviceStartDate;
  dynamic serviceEndDate;
  String? notes;
  String? createdAt;
UserConscriptionStatus copyWith({  String? id,
  String? nationalId,
  String? conscriptionStatus,
  String? exemptionReason,
  dynamic serviceStartDate,
  dynamic serviceEndDate,
  String? notes,
  String? createdAt,
}) => UserConscriptionStatus(  id: id ?? this.id,
  nationalId: nationalId ?? this.nationalId,
  conscriptionStatus: conscriptionStatus ?? this.conscriptionStatus,
  exemptionReason: exemptionReason ?? this.exemptionReason,
  serviceStartDate: serviceStartDate ?? this.serviceStartDate,
  serviceEndDate: serviceEndDate ?? this.serviceEndDate,
  notes: notes ?? this.notes,
  createdAt: createdAt ?? this.createdAt,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['national_id'] = nationalId;
    map['conscription_status'] = conscriptionStatus;
    map['exemption_reason'] = exemptionReason;
    map['service_start_date'] = serviceStartDate;
    map['service_end_date'] = serviceEndDate;
    map['notes'] = notes;
    map['created_at'] = createdAt;
    return map;
  }

}

class UserDiseases {
  UserDiseases({
      this.id, 
      this.nationalId, 
      this.diseaseName, 
      this.diagnosisDate, 
      this.treatment, 
      this.createdAt,});

  UserDiseases.fromJson(dynamic json) {
    id = json['id'];
    nationalId = json['national_id'];
    diseaseName = json['disease_name'];
    diagnosisDate = json['diagnosis_date'];
    treatment = json['treatment'];
    createdAt = json['created_at'];
  }
  String? id;
  String? nationalId;
  String? diseaseName;
  String? diagnosisDate;
  String? treatment;
  String? createdAt;
UserDiseases copyWith({  String? id,
  String? nationalId,
  String? diseaseName,
  String? diagnosisDate,
  String? treatment,
  String? createdAt,
}) => UserDiseases(  id: id ?? this.id,
  nationalId: nationalId ?? this.nationalId,
  diseaseName: diseaseName ?? this.diseaseName,
  diagnosisDate: diagnosisDate ?? this.diagnosisDate,
  treatment: treatment ?? this.treatment,
  createdAt: createdAt ?? this.createdAt,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['national_id'] = nationalId;
    map['disease_name'] = diseaseName;
    map['diagnosis_date'] = diagnosisDate;
    map['treatment'] = treatment;
    map['created_at'] = createdAt;
    return map;
  }

}

class UserAllergies {
  UserAllergies({
      this.id, 
      this.nationalId, 
      this.allergenName, 
      this.reaction, 
      this.createdAt,});

  UserAllergies.fromJson(dynamic json) {
    id = json['id'];
    nationalId = json['national_id'];
    allergenName = json['allergen_name'];
    reaction = json['reaction'];
    createdAt = json['created_at'];
  }
  String? id;
  String? nationalId;
  String? allergenName;
  String? reaction;
  String? createdAt;
UserAllergies copyWith({  String? id,
  String? nationalId,
  String? allergenName,
  String? reaction,
  String? createdAt,
}) => UserAllergies(  id: id ?? this.id,
  nationalId: nationalId ?? this.nationalId,
  allergenName: allergenName ?? this.allergenName,
  reaction: reaction ?? this.reaction,
  createdAt: createdAt ?? this.createdAt,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['national_id'] = nationalId;
    map['allergen_name'] = allergenName;
    map['reaction'] = reaction;
    map['created_at'] = createdAt;
    return map;
  }

}

class MedicalTests {
  MedicalTests({
      this.id, 
      this.nationalId, 
      this.height, 
      this.weight, 
      this.chronicDisease, 
      this.allergies, 
      this.typeOfAllergy, 
      this.xRayImage, 
      this.medicalAnalysis, 
      this.bloodType, 
      this.bloodPressure, 
      this.bloodSugarLevel, 
      this.heartRate, 
      this.testDate, 
      this.createdAt,});

  MedicalTests.fromJson(dynamic json) {
    id = json['id'];
    nationalId = json['national_id'];
    height = json['height'];
    weight = json['weight'];
    chronicDisease = json['chronic_disease'];
    allergies = json['allergies'];
    typeOfAllergy = json['type_of_allergy'];
    xRayImage = json['x_ray_image'];
    medicalAnalysis = json['medical_analysis'];
    bloodType = json['blood_type'];
    bloodPressure = json['blood_pressure'];
    bloodSugarLevel = json['blood_sugar_level'];
    heartRate = json['heart_rate'];
    testDate = json['test_date'];
    createdAt = json['created_at'];
  }
  String? id;
  String? nationalId;
  String? height;
  String? weight;
  String? chronicDisease;
  String? allergies;
  String? typeOfAllergy;
  String? xRayImage;
  String? medicalAnalysis;
  String? bloodType;
  String? bloodPressure;
  String? bloodSugarLevel;
  String? heartRate;
  String? testDate;
  String? createdAt;
MedicalTests copyWith({  String? id,
  String? nationalId,
  String? height,
  String? weight,
  String? chronicDisease,
  String? allergies,
  String? typeOfAllergy,
  String? xRayImage,
  String? medicalAnalysis,
  String? bloodType,
  String? bloodPressure,
  String? bloodSugarLevel,
  String? heartRate,
  String? testDate,
  String? createdAt,
}) => MedicalTests(  id: id ?? this.id,
  nationalId: nationalId ?? this.nationalId,
  height: height ?? this.height,
  weight: weight ?? this.weight,
  chronicDisease: chronicDisease ?? this.chronicDisease,
  allergies: allergies ?? this.allergies,
  typeOfAllergy: typeOfAllergy ?? this.typeOfAllergy,
  xRayImage: xRayImage ?? this.xRayImage,
  medicalAnalysis: medicalAnalysis ?? this.medicalAnalysis,
  bloodType: bloodType ?? this.bloodType,
  bloodPressure: bloodPressure ?? this.bloodPressure,
  bloodSugarLevel: bloodSugarLevel ?? this.bloodSugarLevel,
  heartRate: heartRate ?? this.heartRate,
  testDate: testDate ?? this.testDate,
  createdAt: createdAt ?? this.createdAt,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['national_id'] = nationalId;
    map['height'] = height;
    map['weight'] = weight;
    map['chronic_disease'] = chronicDisease;
    map['allergies'] = allergies;
    map['type_of_allergy'] = typeOfAllergy;
    map['x_ray_image'] = xRayImage;
    map['medical_analysis'] = medicalAnalysis;
    map['blood_type'] = bloodType;
    map['blood_pressure'] = bloodPressure;
    map['blood_sugar_level'] = bloodSugarLevel;
    map['heart_rate'] = heartRate;
    map['test_date'] = testDate;
    map['created_at'] = createdAt;
    return map;
  }

}

class MedicalAnalysis {
  MedicalAnalysis({
      this.id, 
      this.nationalId, 
      this.analysisText, 
      this.analysisDate, 
      this.createdAt,});

  MedicalAnalysis.fromJson(dynamic json) {
    id = json['id'];
    nationalId = json['national_id'];
    analysisText = json['analysis_text'];
    analysisDate = json['analysis_date'];
    createdAt = json['created_at'];
  }
  String? id;
  String? nationalId;
  String? analysisText;
  String? analysisDate;
  String? createdAt;
MedicalAnalysis copyWith({  String? id,
  String? nationalId,
  String? analysisText,
  String? analysisDate,
  String? createdAt,
}) => MedicalAnalysis(  id: id ?? this.id,
  nationalId: nationalId ?? this.nationalId,
  analysisText: analysisText ?? this.analysisText,
  analysisDate: analysisDate ?? this.analysisDate,
  createdAt: createdAt ?? this.createdAt,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['national_id'] = nationalId;
    map['analysis_text'] = analysisText;
    map['analysis_date'] = analysisDate;
    map['created_at'] = createdAt;
    return map;
  }

}

class User {
  User({
      this.id, 
      this.accountId, 
      this.nationalId, 
      this.password, 
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
      this.userId, 
      this.dateOfBirth, 
      this.createdAt,});

  User.fromJson(dynamic json) {
    id = json['id'];
    accountId = json['account_id'];
    nationalId = json['national_id'];
    password = json['password'];
    confirmPassword = json['confirm_password'];
    job = json['job'];
    gender = json['gender'];
    government = json['government'];
    city = json['city'];
    governmentCity = json['government_city'];
    governmentCenter = json['government_center'];
    contact = json['contact'];
    emergencyContact = json['emergency_contact'];
    emergencyName = json['emergency_name'];
    userImage = json['user_image'];
    userId = json['user_id'];
    dateOfBirth = json['date_of_birth'];
    createdAt = json['created_at'];
  }
  String? id;
  String? accountId;
  String? nationalId;
  String? password;
  String? confirmPassword;
  String? job;
  String? gender;
  String? government;
  String? city;
  String? governmentCity;
  String? governmentCenter;
  String? contact;
  String? emergencyContact;
  String? emergencyName;
  String? userImage;
  String? userId;
  dynamic dateOfBirth;
  String? createdAt;
User copyWith({  String? id,
  String? accountId,
  String? nationalId,
  String? password,
  String? confirmPassword,
  String? job,
  String? gender,
  String? government,
  String? city,
  String? governmentCity,
  String? governmentCenter,
  String? contact,
  String? emergencyContact,
  String? emergencyName,
  String? userImage,
  String? userId,
  dynamic dateOfBirth,
  String? createdAt,
}) => User(  id: id ?? this.id,
  accountId: accountId ?? this.accountId,
  nationalId: nationalId ?? this.nationalId,
  password: password ?? this.password,
  confirmPassword: confirmPassword ?? this.confirmPassword,
  job: job ?? this.job,
  gender: gender ?? this.gender,
  government: government ?? this.government,
  city: city ?? this.city,
  governmentCity: governmentCity ?? this.governmentCity,
  governmentCenter: governmentCenter ?? this.governmentCenter,
  contact: contact ?? this.contact,
  emergencyContact: emergencyContact ?? this.emergencyContact,
  emergencyName: emergencyName ?? this.emergencyName,
  userImage: userImage ?? this.userImage,
  userId: userId ?? this.userId,
  dateOfBirth: dateOfBirth ?? this.dateOfBirth,
  createdAt: createdAt ?? this.createdAt,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['account_id'] = accountId;
    map['national_id'] = nationalId;
    map['password'] = password;
    map['confirm_password'] = confirmPassword;
    map['job'] = job;
    map['gender'] = gender;
    map['government'] = government;
    map['city'] = city;
    map['government_city'] = governmentCity;
    map['government_center'] = governmentCenter;
    map['contact'] = contact;
    map['emergency_contact'] = emergencyContact;
    map['emergency_name'] = emergencyName;
    map['user_image'] = userImage;
    map['user_id'] = userId;
    map['date_of_birth'] = dateOfBirth;
    map['created_at'] = createdAt;
    return map;
  }

}