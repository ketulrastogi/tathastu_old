import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class CityModel {
  final String id;
  final String city;
  final String district;
  final String state;
  final List<String> pincode;

  CityModel({this.id, this.city, this.district, this.state, this.pincode,});

  @override
  String toString() => city;

  factory CityModel.fromFirestore(DocumentSnapshot documentSnapshot) => 
    CityModel(
      id: documentSnapshot.documentID,
      city: documentSnapshot.data['city'],
      district: documentSnapshot.data['district'],
      state: documentSnapshot.data['state'],
      pincode: [...documentSnapshot.data['pincode']],
    );
  

  // factory CityModel.fromJson(Map<String, dynamic> data){
  //   print(data);
  //   return CityModel(
  //     city: data['name'],
  //     district: data['district'],
  //     state: data['state'],
  //     pincode: data['pincode'],
  //   );
  // }

  
}


class CityService extends ChangeNotifier {

  Firestore _db;
  List<CityModel> _cities = List();
  CityService.instance(): _db = Firestore.instance {
    _db.collection('cities').snapshots().map((querySnapshot) => 
      querySnapshot.documents.map((documentSnapshot) => 
        _cities.add(CityModel.fromFirestore(documentSnapshot))
      ).toList()
    );
  }

  List<CityModel> get cities => _cities;


  Stream<List<CityModel>> getCities(){
    return _db.collection('cities').snapshots().map((QuerySnapshot querySnapshot){
     return querySnapshot.documents.map((DocumentSnapshot documentSnapshot){
      return CityModel.fromFirestore(documentSnapshot);
    }).toList();
    });
  }


  Future<Map<String, dynamic>> getSingleCity(String pincode) async{
    DocumentSnapshot documentSnapshot =  await _db.collection('cities').document(pincode).get();
    if(!documentSnapshot.exists){
      return null;
    }
    return documentSnapshot.data;
  }



List<CityModel> getSuggestions(String query) {
    List<CityModel> matches = List();
    matches.addAll([...cities]);
    // matches.retainWhere((s) => (s.city.toLowerCase().contains(query.toLowerCase()) || s.pincode.contains(query.toLowerCase())));
    return matches;
  }



}
