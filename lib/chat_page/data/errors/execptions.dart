import '../../../app/data/helpers/failures.dart';

class GetApiResponseException implements Failure {
  @override
  final String message;

  @override
  final Exception? exception;

  GetApiResponseException(this.message, {this.exception});
}

class UpdateChatException implements Failure {
  @override
  final String message;

  @override
  final Exception? exception;

  UpdateChatException(this.message, {this.exception});
}