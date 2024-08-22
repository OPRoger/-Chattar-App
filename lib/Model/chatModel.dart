class ChatModel {
  ChatModel({
    this.id,
    this.message,
    this.senderName,
    this.senderId,
    this.recieverId,
    this.timestamp,
    this.readStatus,
    this.imageUrl,
    this.audioUrl,
    this.videoUrl,
    this.documentUrl,
    this.reaction,
    this.replies,
  });

  ChatModel.fromJson(dynamic json) {
    id = json['id'];
    message = json['message'];
    senderName = json['senderName'];
    senderId = json['senderId'];
    recieverId = json['recieverId'];
    timestamp = json['timestamp'];
    readStatus = json['readStatus'];
    imageUrl = json['imageUrl'];
    audioUrl = json['audioUrl'];
    videoUrl = json['videoUrl'];
    documentUrl = json['documentUrl'];
    reaction = json['reaction'] != null ? json['reaction'].cast<String>() : [];
    if (json['replies'] != null) {
      replies = [];
      json['replies'].forEach((v) {
        replies?.add(v); // Assuming replies are of type dynamic
      });
    }
  }

  String? id;
  String? message;
  String? senderName;
  String? senderId;
  String? recieverId;
  String? timestamp;
  String? readStatus;
  String? imageUrl;
  String? audioUrl;
  String? videoUrl;
  String? documentUrl;
  List<String>? reaction;
  List<dynamic>? replies;

  ChatModel copyWith({
    String? id,
    String? message,
    String? senderName,
    String? senderId,
    String? recieverId,
    String? timestamp,
    String? readStatus,
    String? imageUrl,
    String? audioUrl,
    String? videoUrl,
    String? documentUrl,
    List<String>? reaction,
    List<dynamic>? replies,
  }) =>
      ChatModel(
        id: id ?? this.id,
        message: message ?? this.message,
        senderName: senderName ?? this.senderName,
        senderId: senderId ?? this.senderId,
        recieverId: recieverId ?? this.recieverId,
        timestamp: timestamp ?? this.timestamp,
        readStatus: readStatus ?? this.readStatus,
        imageUrl: imageUrl ?? this.imageUrl,
        audioUrl: audioUrl ?? this.audioUrl,
        videoUrl: videoUrl ?? this.videoUrl,
        documentUrl: documentUrl ?? this.documentUrl,
        reaction: reaction ?? this.reaction,
        replies: replies ?? this.replies,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['message'] = message;
    map['senderName'] = senderName;
    map['senderId'] = senderId;
    map['recieverId'] = recieverId;
    map['timestamp'] = timestamp;
    map['readStatus'] = readStatus;
    map['imageUrl'] = imageUrl;
    map['audioUrl'] = audioUrl;
    map['videoUrl'] = videoUrl;
    map['documentUrl'] = documentUrl;
    map['reaction'] = reaction;
    if (replies != null) {
      map['replies'] = replies?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
