import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

final FirebaseAuth fAuth=FirebaseAuth.instance;
User? currentFirebaseUser;