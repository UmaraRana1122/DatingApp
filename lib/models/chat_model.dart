import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel1 {
  String? uid;
  String? email;
  String? displayName;
  DateTime? dateOfBirth;
  String? photoUrl;

  UserModel1(
      {this.uid,
      this.email,
      this.displayName,
      this.dateOfBirth,
      this.photoUrl});

  factory UserModel1.fromMap(map) {
    if (map == null) {
      return UserModel1(); // Return a default instance or handle it appropriately
    }

    return UserModel1(
      uid: map['uid'],
      email: map['email'],
      displayName: map['displayName'],
      dateOfBirth: (map['dateOfBirth'] as Timestamp).toDate(),
      photoUrl: map['photoUrl'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'displayName': displayName,
      'dateOfBirth': dateOfBirth,
      'photoUrl': photoUrl
    };
  }

  UserModel1 _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserModel1(
        uid: snapshot.get('uid'),
        email: snapshot.get('email'),
        displayName: snapshot.get('displayName'),
        dateOfBirth: snapshot.get('dateOfBirth'),
        photoUrl: snapshot.get('photoUrl'));
  }

  User? user = FirebaseAuth.instance.currentUser;

  Stream<UserModel1> get userModel1 {
    return FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .snapshots()
        .map(_userDataFromSnapshot);
  }
}
