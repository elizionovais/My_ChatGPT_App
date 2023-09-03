import '../../../app/data/helpers/failures.dart';

class GetApiResponseException implements Failure {
  @override
  final String message;

  @override
  final Exception? exception;

  GetApiResponseException(this.message, {this.exception});
}