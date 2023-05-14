import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:otpgenerator/pages/numberinputpage.dart';
import 'pages/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'pages/optionpage.dart';
import 'pages/verifypage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'home',
    routes: {
      'home': (context) => homepage(),
      'otp': (context) => Loginpage(),
      'verify': (context) => verifyPage(
            verificationId: '',
            phone: '',
          ),
      'option': (context) => optionpage()
    },
  ));
}
