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


  // An entity can be an object with methods, or it can be a set of

  // data structures and functions.

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

