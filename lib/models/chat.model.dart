class Chat {
  List<Message>? messages;
  int? startingType;
  String? user1;
  String? user2;
  bool? isActive;
  String? chatID;
  String? lastMessage;
  int? lastMessageDate;
  bool? isStarted;


  Chat.fromJson(Map<String, dynamic> json){
    if(json['messages'] != null) {
      messages = <Message>[];
      json['messages'].forEach((message){
        messages!.add(Message.fromJson(message));
      });      
    }
    user1 = json['user1'];
    user2 = json['user2'];
    isActive = json['isActive'];
    chatID = json['chatID'];
    lastMessage = json['lastMessage'];
    lastMessageDate = json['lastMessageDate'];
    isStarted = json['isStarted'];
  } 

  Map<String,dynamic> toJson() {
    Map<String,dynamic> data = Map<String,dynamic>();
    if(messages != null){
      List<Map<String,dynamic>> jsonMessageList  = [];
      messages!.forEach((message) {
        jsonMessageList.add(message.toJson());
      });
      data['messages'] = jsonMessageList;
    }
    else{
      data['messages'] = [];
    }
    
    data['startingType'] = startingType;
    data['user1'] = user1;
    data['user2'] = user2;
    data['isActive'] = isActive;
    data['chatID'] = chatID;
    data['lastMessage'] = lastMessage;
    data['lastMessageDate'] = lastMessageDate;
    data['isStarted'] = isStarted;
    return data;
  }

}

class Message {
  int? messageId;
  int? type;
  dynamic content;
  String? senderId;
  int? sendingDate;
  bool? isLiked;
  bool? isSeen;


  Message({
    this.messageId,
    this.type,
    this.content,
    this.senderId,
    this.sendingDate,
    this.isLiked,
    this.isSeen
  });


  Message.fromJson(Map<String,dynamic> json){
    messageId = json['messageId'];
    type = json['type'];
    content = json['content'];
    senderId = json['senderId'];
    sendingDate = json['sendingDate'];
    isLiked = json['isLiked'];
  }

  Map<String,dynamic> toJson(){
    Map<String,dynamic> data = Map<String,dynamic>();
    data['type'] = type;
    data['content'] = content;
    data['senderId'] = senderId;
    data['sendingDate'] = sendingDate;
    data['isLiked'] = isLiked;
    data['isSeen'] = isSeen;
    data['messageId'] = messageId;
    return data;
  }



}
