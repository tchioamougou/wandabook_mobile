import 'package:firebase_auth/firebase_auth.dart';

class UserModel  {
  final String uid;
  final String? username;
  final String? email;
  final String? photoUrl;
  final bool? emailVerified;

  UserModel({
    required this.uid,
    this.username,
    this.email,
    this.photoUrl,
    this.emailVerified,
  });

  factory UserModel.fromUserCredential(UserCredential userCredential) {
    return UserModel(
      uid: userCredential.user!.uid,
      email: userCredential.user!.email,
      emailVerified: userCredential.user!.emailVerified,
      photoUrl: userCredential.user!.photoURL,
      // Add other properties as needed
    );
  }

  Map<String, dynamic> toJson() => {
    'uid': uid,
    'username': username,
    'email': email,
    'photoUrl': photoUrl,
    'emailVerified': emailVerified,
  };

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    uid: json['uid'],
    username: json['username'],
    email: json['email'],
    photoUrl: json['photoUrl'],

    emailVerified: json['emailVerified'],
  );
}