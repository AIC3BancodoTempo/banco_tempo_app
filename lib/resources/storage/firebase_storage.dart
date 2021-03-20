import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';

class StorageRepository {
  FirebaseStorage storageInstance;

  StorageRepository() {
    this.storageInstance = FirebaseStorage.instance;
  }

  Future<String> sendChatFile(Uint8List file, String userName) async {
    TaskSnapshot result =
        await storageInstance.ref('chat/' + userName).putData(file);
    final String url = (await result.ref.getDownloadURL());
    return url;
  }

  Future<void> removeFile(String url) async {
    await storageInstance.refFromURL(url).delete();
  }

  Reference getReference(String url) {
    Reference reference = storageInstance.refFromURL(url);
    return reference;
  }
}
