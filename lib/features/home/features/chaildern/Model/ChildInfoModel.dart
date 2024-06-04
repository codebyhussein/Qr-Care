class ChildInfoModel {
  ChildInfoModel({
      this.id, 
      this.parentUserId, 
      this.name, 
      this.age, 
      this.height, 
      this.weight, 
      this.createdAt, 
      this.address, 
      this.emergencyContact, 
      this.nationalId, 
      this.analysisText, 
      this.analysisDate, 
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
      this.allergenName, 
      this.reaction, 
      this.diseaseName, 
      this.diagnosisDate, 
      this.treatment,});

  ChildInfoModel.fromJson(dynamic json) {
    id = json['id'];
    parentUserId = json['parent_user_id'];
    name = json['name'];
    age = json['age'];
    height = json['height'];
    weight = json['weight'];
    createdAt = json['created_at'];
    address = json['address'];
    emergencyContact = json['emergency_contact'];
    nationalId = json['national_id'];
    analysisText = json['analysis_text'];
    analysisDate = json['analysis_date'];
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
    allergenName = json['allergen_name'];
    reaction = json['reaction'];
    diseaseName = json['disease_name'];
    diagnosisDate = json['diagnosis_date'];
    treatment = json['treatment'];
  }
  String? id;
  String? parentUserId;
  String? name;
  String? age;
  String? height;
  String? weight;
  String? createdAt;
  String? address;
  String? emergencyContact;
  String? nationalId;
  String? analysisText;
  String? analysisDate;
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
  String? allergenName;
  String? reaction;
  String? diseaseName;
  String? diagnosisDate;
  String? treatment;
ChildInfoModel copyWith({  String? id,
  String? parentUserId,
  String? name,
  String? age,
  String? height,
  String? weight,
  String? createdAt,
  String? address,
  String? emergencyContact,
  String? nationalId,
  String? analysisText,
  String? analysisDate,
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
  String? allergenName,
  String? reaction,
  String? diseaseName,
  String? diagnosisDate,
  String? treatment,
}) => ChildInfoModel(  id: id ?? this.id,
  parentUserId: parentUserId ?? this.parentUserId,
  name: name ?? this.name,
  age: age ?? this.age,
  height: height ?? this.height,
  weight: weight ?? this.weight,
  createdAt: createdAt ?? this.createdAt,
  address: address ?? this.address,
  emergencyContact: emergencyContact ?? this.emergencyContact,
  nationalId: nationalId ?? this.nationalId,
  analysisText: analysisText ?? this.analysisText,
  analysisDate: analysisDate ?? this.analysisDate,
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
  allergenName: allergenName ?? this.allergenName,
  reaction: reaction ?? this.reaction,
  diseaseName: diseaseName ?? this.diseaseName,
  diagnosisDate: diagnosisDate ?? this.diagnosisDate,
  treatment: treatment ?? this.treatment,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['parent_user_id'] = parentUserId;
    map['name'] = name;
    map['age'] = age;
    map['height'] = height;
    map['weight'] = weight;
    map['created_at'] = createdAt;
    map['address'] = address;
    map['emergency_contact'] = emergencyContact;
    map['national_id'] = nationalId;
    map['analysis_text'] = analysisText;
    map['analysis_date'] = analysisDate;
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
    map['allergen_name'] = allergenName;
    map['reaction'] = reaction;
    map['disease_name'] = diseaseName;
    map['diagnosis_date'] = diagnosisDate;
    map['treatment'] = treatment;
    return map;
  }

}