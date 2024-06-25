class ChildInfoModel {
  ChildInfoModel({
      num? id, 
      String? parentUserId, 
      String? name, 
      num? age, 
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
      num? heartRate, 
      String? testDate, 
      String? allergenName, 
      String? reaction, 
      String? diseaseName, 
      String? diagnosisDate, 
      String? treatment,}){
    _id = id;
    _parentUserId = parentUserId;
    _name = name;
    _age = age;
    _height = height;
    _weight = weight;
    _createdAt = createdAt;
    _address = address;
    _emergencyContact = emergencyContact;
    _nationalId = nationalId;
    _analysisText = analysisText;
    _analysisDate = analysisDate;
    _chronicDisease = chronicDisease;
    _allergies = allergies;
    _typeOfAllergy = typeOfAllergy;
    _xRayImage = xRayImage;
    _medicalAnalysis = medicalAnalysis;
    _bloodType = bloodType;
    _bloodPressure = bloodPressure;
    _bloodSugarLevel = bloodSugarLevel;
    _heartRate = heartRate;
    _testDate = testDate;
    _allergenName = allergenName;
    _reaction = reaction;
    _diseaseName = diseaseName;
    _diagnosisDate = diagnosisDate;
    _treatment = treatment;
}

  ChildInfoModel.fromJson(dynamic json) {
    _id = json['id'];
    _parentUserId = json['parent_user_id'];
    _name = json['name'];
    _age = json['age'];
    _height = json['height'];
    _weight = json['weight'];
    _createdAt = json['created_at'];
    _address = json['address'];
    _emergencyContact = json['emergency_contact'];
    _nationalId = json['national_id'];
    _analysisText = json['analysis_text'];
    _analysisDate = json['analysis_date'];
    _chronicDisease = json['chronic_disease'];
    _allergies = json['allergies'];
    _typeOfAllergy = json['type_of_allergy'];
    _xRayImage = json['x_ray_image'];
    _medicalAnalysis = json['medical_analysis'];
    _bloodType = json['blood_type'];
    _bloodPressure = json['blood_pressure'];
    _bloodSugarLevel = json['blood_sugar_level'];
    _heartRate = json['heart_rate'];
    _testDate = json['test_date'];
    _allergenName = json['allergen_name'];
    _reaction = json['reaction'];
    _diseaseName = json['disease_name'];
    _diagnosisDate = json['diagnosis_date'];
    _treatment = json['treatment'];
  }
  num? _id;
  String? _parentUserId;
  String? _name;
  num? _age;
  String? _height;
  String? _weight;
  String? _createdAt;
  String? _address;
  String? _emergencyContact;
  String? _nationalId;
  String? _analysisText;
  String? _analysisDate;
  String? _chronicDisease;
  String? _allergies;
  String? _typeOfAllergy;
  String? _xRayImage;
  String? _medicalAnalysis;
  String? _bloodType;
  String? _bloodPressure;
  String? _bloodSugarLevel;
  num? _heartRate;
  String? _testDate;
  String? _allergenName;
  String? _reaction;
  String? _diseaseName;
  String? _diagnosisDate;
  String? _treatment;
ChildInfoModel copyWith({  num? id,
  String? parentUserId,
  String? name,
  num? age,
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
  num? heartRate,
  String? testDate,
  String? allergenName,
  String? reaction,
  String? diseaseName,
  String? diagnosisDate,
  String? treatment,
}) => ChildInfoModel(  id: id ?? _id,
  parentUserId: parentUserId ?? _parentUserId,
  name: name ?? _name,
  age: age ?? _age,
  height: height ?? _height,
  weight: weight ?? _weight,
  createdAt: createdAt ?? _createdAt,
  address: address ?? _address,
  emergencyContact: emergencyContact ?? _emergencyContact,
  nationalId: nationalId ?? _nationalId,
  analysisText: analysisText ?? _analysisText,
  analysisDate: analysisDate ?? _analysisDate,
  chronicDisease: chronicDisease ?? _chronicDisease,
  allergies: allergies ?? _allergies,
  typeOfAllergy: typeOfAllergy ?? _typeOfAllergy,
  xRayImage: xRayImage ?? _xRayImage,
  medicalAnalysis: medicalAnalysis ?? _medicalAnalysis,
  bloodType: bloodType ?? _bloodType,
  bloodPressure: bloodPressure ?? _bloodPressure,
  bloodSugarLevel: bloodSugarLevel ?? _bloodSugarLevel,
  heartRate: heartRate ?? _heartRate,
  testDate: testDate ?? _testDate,
  allergenName: allergenName ?? _allergenName,
  reaction: reaction ?? _reaction,
  diseaseName: diseaseName ?? _diseaseName,
  diagnosisDate: diagnosisDate ?? _diagnosisDate,
  treatment: treatment ?? _treatment,
);
  num? get id => _id;
  String? get parentUserId => _parentUserId;
  String? get name => _name;
  num? get age => _age;
  String? get height => _height;
  String? get weight => _weight;
  String? get createdAt => _createdAt;
  String? get address => _address;
  String? get emergencyContact => _emergencyContact;
  String? get nationalId => _nationalId;
  String? get analysisText => _analysisText;
  String? get analysisDate => _analysisDate;
  String? get chronicDisease => _chronicDisease;
  String? get allergies => _allergies;
  String? get typeOfAllergy => _typeOfAllergy;
  String? get xRayImage => _xRayImage;
  String? get medicalAnalysis => _medicalAnalysis;
  String? get bloodType => _bloodType;
  String? get bloodPressure => _bloodPressure;
  String? get bloodSugarLevel => _bloodSugarLevel;
  num? get heartRate => _heartRate;
  String? get testDate => _testDate;
  String? get allergenName => _allergenName;
  String? get reaction => _reaction;
  String? get diseaseName => _diseaseName;
  String? get diagnosisDate => _diagnosisDate;
  String? get treatment => _treatment;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['parent_user_id'] = _parentUserId;
    map['name'] = _name;
    map['age'] = _age;
    map['height'] = _height;
    map['weight'] = _weight;
    map['created_at'] = _createdAt;
    map['address'] = _address;
    map['emergency_contact'] = _emergencyContact;
    map['national_id'] = _nationalId;
    map['analysis_text'] = _analysisText;
    map['analysis_date'] = _analysisDate;
    map['chronic_disease'] = _chronicDisease;
    map['allergies'] = _allergies;
    map['type_of_allergy'] = _typeOfAllergy;
    map['x_ray_image'] = _xRayImage;
    map['medical_analysis'] = _medicalAnalysis;
    map['blood_type'] = _bloodType;
    map['blood_pressure'] = _bloodPressure;
    map['blood_sugar_level'] = _bloodSugarLevel;
    map['heart_rate'] = _heartRate;
    map['test_date'] = _testDate;
    map['allergen_name'] = _allergenName;
    map['reaction'] = _reaction;
    map['disease_name'] = _diseaseName;
    map['diagnosis_date'] = _diagnosisDate;
    map['treatment'] = _treatment;
    return map;
  }

}