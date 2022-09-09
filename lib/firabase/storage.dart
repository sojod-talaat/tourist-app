import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class StorageHelper {
  StorageHelper._();
  static StorageHelper storageHelper = StorageHelper._();
  static FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  Future<String> uploadImage(File file) async {
    String fileName = file.path.split('/').last;
    Reference ref = firebaseStorage.ref(fileName);
    TaskSnapshot image = await ref.putFile(file);
    //مسار الملف في الفايبربيس عشان اعرضه
    String imageurl = await ref.getDownloadURL();
    return imageurl;
  }
}
