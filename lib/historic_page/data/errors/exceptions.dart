import '../../../app/data/helpers/failures.dart';

class GetChatsException implements Failure {
  @override
  final String message;

  @override
  final Exception? exception;

  GetChatsException(this.message, {this.exception});
}

class SaveChatException implements Failure {
  @override
  final String message;

  @override
  final Exception? exception;

  SaveChatException(this.message, {this.exception});
}

class DeleteChatException implements Failure {
  @override
  final String message;

  @override
  final Exception? exception;

  DeleteChatException(this.message, {this.exception});
}