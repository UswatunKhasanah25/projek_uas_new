import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projek_uas_new/pages/sign_in.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _mainCollection = _firestore.collection('kategori');

class DatabaseKategori {

  static Future<void> addItem({
     String kode,
     String kategori,
  }) async {
    DocumentReference documentReferencer =
        _mainCollection.doc(userUid).collection('items').doc();

    Map<String, dynamic> data = <String, dynamic>{
      "kode": kode,
      "kategori": kategori,
    };

    await documentReferencer
        .set(data)
        .whenComplete(() => print("Add Kategori Success"))
        .catchError((e) => print(e));
  }

  static Future<void> updateItem({
     String kode,
     String kategori,
     String docId,
  }) async {
    DocumentReference documentReferencer =
        _mainCollection.doc(userUid).collection('items').doc(docId);

    Map<String, dynamic> data = <String, dynamic>{
      "kode": kode,
      "kategori": kategori,
    };

    await documentReferencer
        .update(data)
        .whenComplete(() => print("Update Kategori Success"))
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
        .whenComplete(() => print('Delete Kategori Success'))
        .catchError((e) => print(e));
  }
}
