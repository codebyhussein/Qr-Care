class UserEntity {
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

  UserEntity({
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

  factory UserEntity.fromJson(Map<String, dynamic> json) {
    return UserEntity(
      id: json['id'],
      accountId: json['accountId'],
      nationalId: json['nationalId'],
      confirmPassword: json['confirmPassword'],
      job: json['job'],
      gender: json['gender'],
      government: json['government'],
      city: json['city'],
      governmentCity: json['governmentCity'],
      governmentCenter: json['governmentCenter'],
      contact: json['contact'],
      emergencyContact: json['emergencyContact'],
      emergencyName: json['emergencyName'],
      userImage: json['userImage'],
      dateOfBirth: json['dateOfBirth'] != null
          ? DateTime.parse(json['dateOfBirth'])
          : null,
      createdAt:
          json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
    );
  }

  static UserEntity empty = UserEntity(
    id: null,
    accountId: null,
    nationalId: null,
    confirmPassword: null,
    job: null,
    gender: null,
    government: null,
    city: null,
    governmentCity: null,
    governmentCenter: null,
    contact: null,
    emergencyContact: null,
    emergencyName: null,
    userImage: null,
    dateOfBirth: null,
    createdAt: null,
  );

  bool get isEmpty => this == UserEntity.empty;

  @override
  List<Object?> get props => [
        id,
        accountId,
        nationalId,
        confirmPassword,
        job,
        gender,
        government,
        city,
        governmentCenter,
        governmentCity,
        contact,
        emergencyContact,
        emergencyName,
        dateOfBirth,
        createdAt,
        userImage,
      ];
}
