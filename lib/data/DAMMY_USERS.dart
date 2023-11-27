import 'package:grs/models/user_model.dart';

List<UserModel> generateDummyUserModels() {
  return List.generate(10, (index) {
    return UserModel(
      id: index + 1,
      name: 'User ${index + 1}',
      identificacao: 'ID_${index + 1}',
      email: 'user${index + 1}@example.com',
      telefone: '123456789${index + 1}',
      emailVerifiedAt: DateTime.now(),
      password: 'password${index + 1}',
      twoFactorSecret: 'two_factor_secret_${index + 1}',
      twoFactorRecoveryCodes: 'recovery_codes_${index + 1}',
      twoFactorConfirmedAt: DateTime.now(),
      rememberToken: 'token_${index + 1}',
      currentTeamId: index + 100,
      profilePhotoPath: 'path/to/photo_${index + 1}.jpg',
      uuid: 'uuid_${index + 1}',
      isActive: index % 2, // Alternates between 0 and 1
      isAfrizona: (index + 1) % 2, // Alternates between 0 and 1
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  });
}
