import 'package:dartz/dartz.dart';

import '../../../app/data/helpers/failures.dart';
import '../../../app/data/helpers/use_case.dart';
import '../entities/chat_entity.dart';
import '../repositories/update_chat_repository.dart';

class UpdateChatUseCase extends UseCase<bool, ChatEntity> {
  final UpdateChatRepository repository;

  UpdateChatUseCase({required this.repository});

  @override
  Future<Either<Failure, bool>> call(ChatEntity params) {
    return repository.updateChat(
      params
    );
  }
}