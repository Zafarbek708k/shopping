

    import 'package:cloud_firestore/cloud_firestore.dart';

class CloudFireStoreService{

 static final FirebaseFirestore db = FirebaseFirestore.instance;

  static Future<void> storeData({required String collectionPath, required Map<String, dynamic>data})async{
    await  db.collection(collectionPath).add(data);
  }


 static Future<List<Map<String, dynamic>>> readData(
     {required String collectionPath}) async {
   QuerySnapshot<Map<String, dynamic>> querySnapshot =
   await db.collection(collectionPath).get();

   List<Map<String, dynamic>> documents = [];
   querySnapshot.docs.forEach((doc) {
     documents.add(doc.data());
   });

   return documents;
 }

 static Future<void> updateData(
     {required String collectionPath,
       required String documentId,
       required Map<String, dynamic> data}) async {
   await db.collection(collectionPath).doc(documentId).update(data);
 }

 static Future<void> deleteData(
     {required String collectionPath, required String documentId}) async {
   await db.collection(collectionPath).doc(documentId).delete();
 }


  }