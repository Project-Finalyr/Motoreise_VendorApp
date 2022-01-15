import 'package:cloud_firestore/cloud_firestore.dart';
class DatabaseMethods{
 Future addUserInfoToDB(String userId,Map<String,dynamic>userInfoMap) async{
   return  Firestore.instance.collection("users").document(userId).setData(userInfoMap);
  }
}
class DatabaseService{
  final String uid;
  DatabaseService({ this.uid });

  // collection reference
  final CollectionReference brewCollection = Firestore.instance.collection('Partners');

  Future<void> updateUserData(String fullname, String Email,String phonenumber,String address,occupation,experience,details,String accountnumber,String bankname,String aadharnumber,String pannumber,String certification) async {
    return await brewCollection.document(uid).setData({
      'fullname': fullname,
      'Email': Email,
      'address':address,
      'occupation':occupation,
      'experience':experience,
      'details':details,
      'phonenumber':phonenumber,
      'accountnumber':accountnumber,
      'bankname':bankname,
      'aadharnumber':aadharnumber,
      'pannumber':pannumber,
      'certification':certification,



    });
  }

}
