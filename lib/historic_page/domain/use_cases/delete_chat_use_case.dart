import 'package:dartz/dartz.dart';

import '../../../app/data/helpers/failures.dart';
import '../../../app/data/helpers/use_case.dart';
import '../../../chat_page/domain/entities/chat_entity.dart';
import '../repositories/chat_repository.dart';

class DeleteChatUseCase extends UseCase<bool, ChatEntity> {
  final ChatRepository repository;

  DeleteChatUseCase({required this.repository});

  @override
  Future<Either<Failure, bool>> call(ChatEntity params) {
    return repository.deleteChat(
      params
    );
  }
}