import 'dart:async';
import 'dart:io';

import 'package:app_models/app_models.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:logger_client/logger_client.dart';

class StorageCollection with LoggerMixin {
  StorageCollection(this.userID);

  final String path = '';

  final String userID;

  FirebaseStorage firestoreStorage = FirebaseStorage.instance;

  /// Get the reference to storage location object
  Reference storageRef(String path) {
    return FirebaseStorage.instance.ref().child(userID).child(path);
  }

  /// Upload user Avatar
  Future<String> uploadAvatar(File file) async {
    final ref = storageRef('_avatars');
    return ref.putFile(file).then((_) => ref.getDownloadURL());
  }

  /// Upload any file
  UploadTask uploadFile(File file, String path) {
    final ref = storageRef(path);
    return ref.putFile(file);
  }

  Future<String> getDownloadURL(String path) {
    final ref = storageRef(path);
    return ref.getDownloadURL();
  }

  Reference getMediumRef(MediaModel mediaModel) {
    return FirebaseStorage.instance
        .ref()
        .child(userID)
        .child(mediaModel.caseID)
        .child(mediaModel.fileName!);
  }

  Reference getOriginalRef(MediaModel mediaModel) {
    /// important to keepp --in front of original to show them
    /// first in firebase storage folders list
    return FirebaseStorage.instance
        .ref()
        .child(userID)
        .child('--originals')
        .child(mediaModel.caseID)
        .child(mediaModel.fileName!);
  }

  Reference getThumbRef(MediaModel mediaModel) {
    return FirebaseStorage.instance
        .ref()
        .child(userID)
        .child(mediaModel.caseID)
        .child('thumb_${mediaModel.fileName}');
  }

  Future<void> deleteMedia(MediaModel mediaModel) {
    final futures = <Future>[
      if (mediaModel.thumbUri?.isEmpty ?? false)
        getThumbRef(mediaModel).delete(),
      if (mediaModel.mediumUri?.isEmpty ?? false)
        getThumbRef(mediaModel).delete(),
      if (mediaModel.mediumUri?.isEmpty ?? false)
        getOriginalRef(mediaModel).delete(),
    ];

    return futures.wait;
  }
}
