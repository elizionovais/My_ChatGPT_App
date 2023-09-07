import '../../domain/entities/chat_entity.dart';

class ChatModel{
  final String message;
  final String role;
  final String? typeAssistant;
  final String? id;
  final DateTime time;

  ChatModel({
    required this.message,
    required this.role,
    this.typeAssistant,
    this.id,
    required this.time,
  });

  factory ChatModel.fromJson(Map<String, dynamic> json) {
    return ChatModel(
      message: json['message'],
      role: json['role'],
      typeAssistant: json['typeAssistant'],
      id: json['id'],
      time: DateTime.parse(json['time']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'sender': role,
      'typeAssistant': typeAssistant,
      'id': id,
      'time': time.toIso8601String(),
    };
  }

  factory ChatModel.fromEntity(ChatEntity entity) {
    return ChatModel(
      message: entity.message,
      role: entity.role,
      typeAssistant: entity.typeAssistant,
      id: entity.id,
      time: entity.time,
    );
  }

  ChatEntity toEntity() {
    return ChatEntity(
      message: message,
      role: role,
      typeAssistant: typeAssistant,
      id: id,
      time: time,
    );
  }
}