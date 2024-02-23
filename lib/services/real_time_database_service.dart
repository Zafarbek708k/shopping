
import 'package:firebase_database/firebase_database.dart';

class RealTimeDataBaseService{
  static DatabaseReference reference = FirebaseDatabase.instance.ref();

  static Future<void>storeData({required Map<String, dynamic>data, required String path})async{
    String? key = reference.child(path).push().key;
    await reference.child(path).child(key!).set(data);
  }

}