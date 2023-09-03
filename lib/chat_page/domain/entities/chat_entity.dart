

class ChatEntity {
  final String message;
  final String role;
  final String? typeAssistant;
  final DateTime time;

  ChatEntity({
    required this.message,
    required this.role,
    this.typeAssistant,
    required this.time,
  });
}