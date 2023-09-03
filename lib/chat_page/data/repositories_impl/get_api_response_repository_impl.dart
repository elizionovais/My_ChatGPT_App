import 'package:dartz/dartz.dart';
import 'package:my_chat_gpt/chat_page/data/models/chat_model.dart';

import '../../../app/data/helpers/failures.dart';
import '../../domain/entities/chat_entity.dart';
import '../../domain/repositories/get_api_response_repository.dart';
import '../data_source/get_api_response_data_source.dart';
import '../errors/execptions.dart';

class GetApiResponseRepositoryImpl implements GetApiResponseRepository {
  final GetApiResponseDataSource dataSource;

  GetApiResponseRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, ChatEntity>> getApiResponse(ChatEntity chat) async {
    try {
      final result = await dataSource.getApiResponse(
        ChatModel.fromEntity(chat));

      return Right(result.toEntity());
    } catch (e) {
      if (e is Failure) {
        return Left(e);
      }
      return Left(GetApiResponseException(e.toString()));
    }
  }
}