class UserModel {
  int id;
  String name;
  String identificacao;
  String email;
  String telefone;
  DateTime emailVerifiedAt;
  String password;
  String twoFactorSecret;
  String twoFactorRecoveryCodes;
  DateTime twoFactorConfirmedAt;
  String rememberToken;
  int currentTeamId;
  String profilePhotoPath;
  String uuid;
  int isActive;
  int isAfrizona;
  DateTime createdAt;
  DateTime updatedAt;

  UserModel({
    required this.id,
    required this.name,
    required this.identificacao,
    required this.email,
    required this.telefone,
    required this.emailVerifiedAt,
    required this.password,
    required this.twoFactorSecret,
    required this.twoFactorRecoveryCodes,
    required this.twoFactorConfirmedAt,
    required this.rememberToken,
    required this.currentTeamId,
    required this.profilePhotoPath,
    required this.uuid,
    required this.isActive,
    required this.isAfrizona,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      identificacao: json['identificacao'],
      email: json['email'],
      telefone: json['telefone'],
      emailVerifiedAt: DateTime.parse(json['email_verified_at']),
      password: json['password'],
      twoFactorSecret: json['two_factor_secret'],
      twoFactorRecoveryCodes: json['two_factor_recovery_codes'],
      twoFactorConfirmedAt: DateTime.parse(json['two_factor_confirmed_at']),
      rememberToken: json['remember_token'],
      currentTeamId: json['current_team_id'],
      profilePhotoPath: json['profile_photo_path'],
      uuid: json['uuid'],
      isActive: json['is_active'],
      isAfrizona: json['is_afrizona'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'identificacao': identificacao,
      'email': email,
      'telefone': telefone,
      'email_verified_at': emailVerifiedAt.toIso8601String(),
      'password': password,
      'two_factor_secret': twoFactorSecret,
      'two_factor_recovery_codes': twoFactorRecoveryCodes,
      'two_factor_confirmed_at': twoFactorConfirmedAt.toIso8601String(),
      'remember_token': rememberToken,
      'current_team_id': currentTeamId,
      'profile_photo_path': profilePhotoPath,
      'uuid': uuid,
      'is_active': isActive,
      'is_afrizona': isAfrizona,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}
