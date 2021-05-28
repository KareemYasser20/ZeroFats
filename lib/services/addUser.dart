import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zerofats/constants.dart';
import 'package:zerofats/models/user_data.dart';

class AddUser {
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  addUser (UserData data) async{
    await _fireStore.collection(kUserCollection).add({
      kUserName : data.firstName + ' ' + data.lastName,
      kUserGender : data.gender,
      kUserBirthYear: data.yearOfBirth ,
      kUserHeight : data.height,
      kUserWeight : data.weight ,
      kUserEmail : data.email ,
      kUserId : data.id,
      kUserBMI : data.bmi,
      kUserSteps : 0,
      KUserBmiCategory: data.bmiCategory,
    });
  }

  Stream<QuerySnapshot> loadUser() {
    return _fireStore.collection(kUserCollection).snapshots();
  }

  updateUser(data, documentID) {
    _fireStore.collection(kUserCollection).doc(documentID).update(data);
  }
}