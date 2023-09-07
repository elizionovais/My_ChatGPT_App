import 'package:dartz/dartz.dart';

import '../../../app/data/helpers/failures.dart';
import '../../../app/data/helpers/use_case.dart';
import '../../../chat_page/domain/entities/chat_entity.dart';
import '../repositories/chat_repository.dart';

class GetChatsUseCase extends UseCase<List<ChatEntity>, NoParams> {
  final ChatRepository repository;

  GetChatsUseCase({required this.repository});

  @override
  Future<Either<Failure, List<ChatEntity>>> call(NoParams params) {
    return repository.getChats();
  }
}