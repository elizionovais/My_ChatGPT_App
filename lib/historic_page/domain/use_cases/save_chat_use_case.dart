import 'package:dartz/dartz.dart';

import '../../../app/data/helpers/failures.dart';
import '../../../app/data/helpers/use_case.dart';
import '../../../chat_page/domain/entities/chat_entity.dart';
import '../repositories/chat_repository.dart';

class SaveChatUseCase extends UseCase<String, ChatEntity> {
  final ChatRepository repository;

  SaveChatUseCase({required this.repository});

  @override
  Future<Either<Failure, String>> call(ChatEntity params) {
    return repository.saveChat(
      params
    );
  }
}