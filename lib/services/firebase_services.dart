
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class Services{
  //Auth has a class we will tak an object
  final auth = FirebaseAuth.instance;

  //We need the current user
  static Rxn<User> currentFirebaseUser = Rxn<User>();

  //Firebase database
  final store = FirebaseDatabase.instance;
  final cloudStore = FirebaseFirestore.instance;

}