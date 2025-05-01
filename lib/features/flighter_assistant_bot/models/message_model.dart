class ChatMessageModel {
  final bool isUser;
  final String message;
  final DateTime date;

  ChatMessageModel({
    required this.isUser,
    required this.message,
    required this.date,
  });
}
