import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:tathastu/service/city_service.dart';

Firestore _db = Firestore.instance;
FirebaseAuth _auth = FirebaseAuth.instance;
class UserModel {
  String uid;
  String phoneNumber;
  String displayName;
  String email;
  String city;
  String district;
  String state;
  List<String> pincode;
  String gender;
  DateTime birthdate;

  UserModel(
      {this.uid,
      this.phoneNumber,
      this.displayName,
      this.email,
      this.city,
      this.district,
      this.state,
      this.pincode,
      this.gender,
      this.birthdate});

  factory UserModel.fromFirestore(DocumentSnapshot documentSnapshot) {
    Map data = documentSnapshot.data;
    String uid = documentSnapshot.documentID;

    return UserModel(
      uid: uid,
      phoneNumber:
          (data.containsKey('phoneNumber') && data['phoneNumber'] != null)
              ? data['phoneNumber']
              : null,
      displayName:
          (data.containsKey('displayName') && data['displayName'] != null)
              ? data['displayName']
              : null,
      email: (data.containsKey('email') && data['email'] != null)
          ? data['email']
          : null,
      city: (data.containsKey('city') && data['city'] != null)
          ? data['city']
          : null,
      pincode: (data.containsKey('pincode') && data['pincode'] != null)
          ? [...data['pincode']]
          : null,
      district: (data.containsKey('district') && data['district'] != null)
          ? data['district']
          : null,
      state: (data.containsKey('state') && data['state'] != null)
          ? data['state']
          : null,
      gender: (data.containsKey('gender') && data['gender'] != null)
          ? data['gender']
          : null,
      birthdate: (data.containsKey('birthdate') && data['birthdate'] != null)
          ?  (data['birthdate'] as Timestamp).toDate()
          : null,
    );
  }
}

enum USERSTATUS { UPDATED, NOTUPDATED }
class UserService with ChangeNotifier {
  String _userId;
  String _phoneNumber;
  
  UserModel _user;
  USERSTATUS userStatus = USERSTATUS.NOTUPDATED;

  UserService.instance(String uid, String phoneNumber) {
    _userId = uid;
    _phoneNumber = phoneNumber;
    notifyListeners();
    _db
        .collection('users')
        // .where('uid', isEqualTo: uid)
        // .limit(1)
        .document(uid)
        .snapshots()
        .listen((DocumentSnapshot documentSnapshot) {
          _user = UserModel.fromFirestore(documentSnapshot);
          setUserStatus();          
      });
   
  }




  void setUserStatus(){
    if (_user.displayName != null &&
              _user.phoneNumber != null &&
              _user.city != null &&
              _user.pincode != null &&
              _user.email != null &&
              _user.district != null &&
              _user.state != null &&
              _user.birthdate != null) {
            userStatus = USERSTATUS.UPDATED;
            notifyListeners();
          } else {
            userStatus = USERSTATUS.NOTUPDATED;
            notifyListeners();
          }
  }

  String get uid => _userId;
  String get phoneNumber => _phoneNumber;
  UserModel get user => _user;

  Stream<UserModel> getCurrentUserDetails() {
    return _db.collection('users').document(uid).snapshots().map(
        (DocumentSnapshot documentSnapshot) =>
            UserModel.fromFirestore(documentSnapshot));
  }

  Future<void> updateUserDetails(String displayName, String email,
      CityModel city, DateTime birthdate, String gender) async {
    print('User Service - 94 : $uid');
    await _db.collection('users').document(uid).setData({
      'displayName': displayName,
      'email': email,
      'city': city.city,
      'district': city.district,
      'state': city.state,
      'pincode': city.pincode,
      'birthdate': Timestamp.fromDate(birthdate),
      'gender': gender,
    }, merge: true);
    userStatus = USERSTATUS.UPDATED;
    notifyListeners();
  }

  Future<void> updateDisplayName(String uid, String displayName) async {
    await _db
        .collection('users')
        .document(uid)
        .setData({'displayName': displayName}, merge: true);
  }

  Future<void> updateEmail(String uid, String email) async {
    await _db
        .collection('users')
        .document(uid)
        .setData({'email': email}, merge: true);
  }

  Future<void> updateUserCity(String uid, String city, String pincode) async {
    await _db
        .collection('users')
        .document(uid)
        .setData({'city': city, 'pincode': pincode}, merge: true);
  }
}
