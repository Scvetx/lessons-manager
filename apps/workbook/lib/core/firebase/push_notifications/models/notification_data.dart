import 'package:firebase_auth/firebase_auth.dart';

class NotificationData {

  NotificationData.fromJson(Map<String, dynamic> json) :
    type = json['type'] ?? '',
    screenName = json['screenName'] ?? '',
    receiverId = json['receiverId'] ?? '',
    authorId = json['authorId'] ??  '',
    messageId = json['messageId'] ?? '',
    roomId = json['roomId'] ?? ''
    {
      final currentUserId = FirebaseAuth.instance.currentUser?.uid;
      isCurrentUser = currentUserId != null && receiverId == currentUserId;
    }
    
  final String type;
  final String screenName;
  final String receiverId;
  final String authorId;
  late final bool isCurrentUser;
  late final String messageId;
  late final String roomId;

  Map<String, dynamic> toJson() => {
    'type': type,
    'screenName': screenName,
    'receiverId': receiverId,
    'authorId': authorId,
    'isCurrentUser': isCurrentUser,
    'messageId': messageId,
    'roomId': roomId,
  };
}
