import 'package:chat_grupal/features/group/domain/entities/group_entity.dart';
import 'package:chat_grupal/features/group/domain/repositories/group_repository.dart';

class GetGroupsUseCase {
  final GroupRepository repository;

  GetGroupsUseCase({required this.repository});

  Stream<List<GroupEntity>> call() {
    return repository.getGroups();
  }
}
