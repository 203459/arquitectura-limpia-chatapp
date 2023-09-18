import 'package:chat_grupal/features/user/domain/repositories/user_repository.dart';

class GetCurrentUIDUseCase {
  final UserRepository repository;

  GetCurrentUIDUseCase({required this.repository});
  Future<String> call() async {
    return await repository.getCurrentUId();
  }
}
