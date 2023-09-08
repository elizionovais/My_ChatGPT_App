

class ChatEntity {
  final String message;
  final String role;
  final String? typeAssistant;
  String? id;
  final DateTime time;

  ChatEntity({
    required this.message,
    required this.role,
    this.typeAssistant,
    this.id,
    required this.time,
  });
}