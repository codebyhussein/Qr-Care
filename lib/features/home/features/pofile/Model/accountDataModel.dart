class AccountDataModel {
  AccountDataModel({
      this.status, 
      this.data,});

  AccountDataModel.fromJson(dynamic json) {
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? status;
  Data? data;
AccountDataModel copyWith({  String? status,
  Data? data,
}) => AccountDataModel(  status: status ?? this.status,
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
      this.accountId, 
      this.government, 
      this.city, 
      this.governmentCenter, 
      this.job, 
      this.contact, 
      this.emergencyContact,});

  Data.fromJson(dynamic json) {
    accountId = json['account_id'];
    government = json['government'];
    city = json['city'];
    governmentCenter = json['government_center'];
    job = json['job'];
    contact = json['contact'];
    emergencyContact = json['emergency_contact'];
  }
  String? accountId;
  String? government;
  String? city;
  String? governmentCenter;
  String? job;
  String? contact;
  String? emergencyContact;
Data copyWith({  String? accountId,
  String? government,
  String? city,
  String? governmentCenter,
  String? job,
  String? contact,
  String? emergencyContact,
}) => Data(  accountId: accountId ?? this.accountId,
  government: government ?? this.government,
  city: city ?? this.city,
  governmentCenter: governmentCenter ?? this.governmentCenter,
  job: job ?? this.job,
  contact: contact ?? this.contact,
  emergencyContact: emergencyContact ?? this.emergencyContact,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['account_id'] = accountId;
    map['government'] = government;
    map['city'] = city;
    map['government_center'] = governmentCenter;
    map['job'] = job;
    map['contact'] = contact;
    map['emergency_contact'] = emergencyContact;
    return map;
  }

}