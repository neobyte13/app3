// import 'package:GberaaDelivery/models/ditem_model.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class FirestoreService {
//   FirebaseFirestore _db = FirebaseFirestore.instance;

//   //retrieve
//   Stream<List<Ditem>> getDitems() {
//     return _db.collection('ditems').snapshots().map((snapshot) =>
//         snapshot.docs.map((doc) => Ditem.fromJson(doc.data())).toList());
//   }

//   //upsert
//   Future<void> setDitem(Ditem ditem) {
//     var options = SetOptions(merge: true);

//     return _db.collection('ditems').doc(ditem.id).set(ditem.toMap(), options);
//   }

//   //delete
//   Future<void> deleteDitem(String id) {
//     return _db.collection('ditems').doc(id).delete();
//   }
// }
