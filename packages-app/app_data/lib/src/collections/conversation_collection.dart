// part of '../database_service.dart';

// /// Implementation of [DatabaseCollection] with [ConversationCollection] collection
// class ConversationCollection extends DatabaseCollection<Conversation> {
//   ConversationCollection(
//     super.user,
//     super.realm,
//     super.sharedPrefs,
//   ) {
//     createCollectionStream();
//   }

//   @override
//   String get path => '$root/$userID/${DbCollection.conversation.name}';

//   @override
//   CollectionReference<Conversation> get withConverter =>
//       firestore.collection(path).withConverter<Conversation>(
//             fromFirestore: (snapshot, _) =>
//                 ConversationX.fromJson(snapshot.data()!),
//             toFirestore: (conversation, _) => conversation.toJson(),
//           );

//   @override
//   Stream<List<Conversation>> listenForChanges() {
//     return stream.map((querySnapshot) {
//       final documents = querySnapshot.docChanges
//           .map((change) {
//             final model = ConversationX.fromJson(change.doc.data()!);
//             print('ConversationCollection ${model.id} ${change.type}');
//             return realm
//                 .write(() => realm.add<Conversation>(model, update: true));
//           })
//           .whereType<Conversation>()
//           .toList();

//       // set last update time
//       setLastSyncTimestamp();
//       return documents;
//     });
//   }

//   void addConversation({required String title}) {
//     realm.write(() {
//       //ealm.deleteAll<Conversation>();
//       final item = Conversation(ModelUtils.uniqueID, title: title);
//       put(item.id, item);
//       //realm.add<Conversation>(Conversation(ModelUtils.uniqueID, title: title));
//     });
//   }

//   // void addParticipant({required String name}) {
//   //   realm.write(() {
//   //     final firstConversation = realm.all<Conversation>().first;
//   //     firstConversation.participants
//   //         .add(Participant(ModelUtils.uniqueID, name: name));
//   //   });
//   // }

//   void addMediaModel() {
//     realm.write(() {
//       final firstConversation = realm.all<Conversation>().first;
//       firstConversation.mediaModels
//           .add(MediaModel(ModelUtils.uniqueID, userID));
//     });
//   }
// }
