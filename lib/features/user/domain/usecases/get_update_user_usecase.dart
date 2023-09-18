import 'package:chat_grupal/features/user/domain/entities/user_entity.dart';
import 'package:chat_grupal/features/user/domain/repositories/user_repository.dart';

class GetUpdateUserUseCase {
  final UserRepository repository;

  GetUpdateUserUseCase({required this.repository});
  Future<void> call(UserEntity user) {
    return repository.getUpdateUser(user);
  }
}
