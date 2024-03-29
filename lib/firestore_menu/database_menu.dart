import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projek_uas_new/pages/sign_in.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _mainCollection = _firestore.collection('menu');

class Database {

  static Future<void> addItem({
     String menu,
     String jenis,
     int harga,
     int stok,
  }) async {
    DocumentReference documentReferencer =
        _mainCollection.doc(userUid).collection('items').doc();

    Map<String, dynamic> data = <String, dynamic>{
      "menu": menu,
      "jenis": jenis,
      "harga": harga,
      "stok": stok,
    };

    await documentReferencer
        .set(data)
        .whenComplete(() => print("Added Menu Success"))
        .catchError((e) => print(e));
  }

  static Future<void> updateItem({
     String menu,
     String jenis,
     int harga,
     int stok,
     String docId,
  }) async {
    DocumentReference documentReferencer =
        _mainCollection.doc(userUid).collection('items').doc(docId);

    Map<String, dynamic> data = <String, dynamic>{
      "menu": menu,
      "jenis": jenis,
      "harga": harga,
      "stok": stok,
    };

    await documentReferencer
        .update(data)
        .whenComplete(() => print("Update Menu"))
        .catchError((e) => print(e));
  }

  static Stream<QuerySnapshot> readItems() {
    CollectionReference notesItemCollection =
        _mainCollection.doc(userUid).collection('items');

    return notesItemCollection.snapshots();
  }

  static Future<void> deleteItem({
     String docId,
  }) async {
    DocumentReference documentReferencer =
        _mainCollection.doc(userUid).collection('items').doc(docId);

    await documentReferencer
        .delete()
        .whenComplete(() => print('Delete Menu Success'))
        .catchError((e) => print(e));
  }
}
