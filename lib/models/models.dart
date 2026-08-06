enum PostVisibility { public, connections, private }

class Professional {
  final String id;
  final String name;
  final String specialty;
  final String city;
  final String avatarSeed;
  final double rating;
  final int reviewCount;
  final int connections;
  final int yearsExperience;
  final bool verified;
  final String bio;

  const Professional({
    required this.id,
    required this.name,
    required this.specialty,
    required this.city,
    required this.avatarSeed,
    required this.rating,
    required this.reviewCount,
    required this.connections,
    required this.yearsExperience,
    this.verified = true,
    this.bio = '',
  });
}

class Post {
  final String id;
  final Professional author;
  final String text;
  final bool hasImage;
  final int likes;
  final int comments;
  final String timeAgo;
  final PostVisibility visibility;

  const Post({
    required this.id,
    required this.author,
    required this.text,
    required this.timeAgo,
    this.hasImage = false,
    this.likes = 0,
    this.comments = 0,
    this.visibility = PostVisibility.public,
  });
}

class Comment {
  final String author;
  final String specialty;
  final String text;
  final String timeAgo;

  const Comment({
    required this.author,
    required this.specialty,
    required this.text,
    required this.timeAgo,
  });
}

class Review {
  final String reviewerName;
  final double rating;
  final String comment;

  const Review({
    required this.reviewerName,
    required this.rating,
    required this.comment,
  });
}

class Conversation {
  final Professional peer;
  final String lastMessage;
  final String timeAgo;
  final bool unread;

  const Conversation({
    required this.peer,
    required this.lastMessage,
    required this.timeAgo,
    this.unread = false,
  });
}

class ChatMessage {
  final String text;
  final bool isMe;
  final String time;

  const ChatMessage({required this.text, required this.isMe, required this.time});
}

enum NotificationType { connection, comment, like, verification, admin }

class AppNotification {
  final NotificationType type;
  final String text;
  final String timeAgo;
  final bool unread;

  const AppNotification({
    required this.type,
    required this.text,
    required this.timeAgo,
    this.unread = false,
  });
}

class VerificationRequest {
  final Professional applicant;
  final String licenseDoc;

  const VerificationRequest({required this.applicant, required this.licenseDoc});
}
