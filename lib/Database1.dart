import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:motoreise_partnerapp/bookingscreenform.dart';
class DatabaseService{
  final String uid;
  final String city;
  DatabaseService({ this.uid ,this.city});

  // collection reference
  final CollectionReference brewCollection = Firestore.instance.collection('Trips');

  Future<void> updateUserData(String Name, String phonenumber,String occupation,String city,String rate,String slots) async {
    return await brewCollection.document(city).collection("Vendor").document(uid).setData({
      'Name': Name,
      'phonenumber':phonenumber,
      'occupation':occupation,
      'city':city,
      'rate':rate,
      'slots':slots





    });
  }

}
