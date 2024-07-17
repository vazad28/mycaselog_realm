// import 'package:json_annotation/json_annotation.dart';
// import 'package:realm/realm.dart';

// part 'conversation.realm.dart';
// part 'conversation.g.dart';

// @RealmModel()
// @JsonSerializable(explicitToJson: true)
// class _Conversation {
//   @PrimaryKey()
//   late String id;
//   late String? title;
//   late String? description;
//   late DateTime? createdAt;
//   @JsonKey(includeFromJson: false, includeToJson: false)
//   List<_Participant> participants = [];
//   @JsonKey(includeFromJson: false, includeToJson: false)
//   List<_Message> messages = [];
//   int timestamp = 0;
//   int removed = 0;

//   Map<String, dynamic> toJson() => _$ConversationToJson(this);

//   Conversation toRealmObject() {
//     return Conversation(id,
//         createdAt: DateTime.now(),
//         title: title,
//         description: description,
//         participants:
//             participants.map((e) => Participant._fromEJson(e.toEJson())),
//         messages: messages.map((e) => Message._fromEJson(e.toEJson())),
//         removed: removed,
//         timestamp: timestamp);
//   }
// }

// extension ConversationX on Conversation {
//   static Conversation fromJson(Map<String, dynamic> json) =>
//       _$ConversationFromJson(json).toRealmObject();
// }

// @RealmModel()
// @JsonSerializable(explicitToJson: true)
// class _Participant {
//   @PrimaryKey()
//   late String id;
//   late String? name;

//   @JsonKey(includeFromJson: false, includeToJson: false)
//   @Backlink(#participants)
//   late Iterable<_Conversation> linkedConversation;

//   late List<_Message> messages;

//   static Participant fromJson(Map<String, dynamic> json) =>
//       _$ParticipantFromJson(json).toRealmObject();

//   Map<String, dynamic> toJson() => _$ParticipantToJson(this);

//   Participant toRealmObject() {
//     return Participant(id, name: name);
//   }
// }

// @RealmModel()
// @JsonSerializable(explicitToJson: true)
// class _Message {
//   @PrimaryKey()
//   late String id;
//   late String content;

//   @JsonKey(includeFromJson: false, includeToJson: false)
//   @Backlink(#messages)
//   late Iterable<_Participant> linkedParticipant;

//   @JsonKey(includeFromJson: false, includeToJson: false)
//   @Backlink(#messages)
//   late Iterable<_Conversation> linkedConversation;

//   static Message fromJson(Map<String, dynamic> json) =>
//       _$MessageFromJson(json).toRealmObject();

//   Map<String, dynamic> toJson() => _$MessageToJson(this);

//   Message toRealmObject() {
//     return Message(id, content);
//   }
// }

// // extension MessageX on Message {
// //   static Message fromJson(Map<String, dynamic> json) =>
// //       _$MessageFromJson(json).toRealmObject();

// //   Map<String, dynamic> toJson() => _$MessageToJson(this);
// // }
