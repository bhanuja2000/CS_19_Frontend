import 'package:flutter/material.dart';
import 'package:textfild/Get_started_pages/get_started.dart';
import 'package:textfild/passwordreset.dart';
import 'package:textfild/profile.dart';
import 'package:textfild/repassword.dart';
import 'package:textfild/reset.dart';
import 'package:textfild/session.dart';
import 'package:textfild/signup.dart';
import 'package:textfild/subplan.dart';
import 'package:textfild/textfild.dart';
import 'package:textfild/verification.dart';

void main() => runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GetStartedScreen(),
      // routes: <String, WidgetBuilder>{
      //   'register': (BuildContext context) => const TextFild(),
      //   'signup': (BuildContext context) => const Signup(),
      //   'sig': (BuildContext context) => const Repasssword(),
      //   'si': (BuildContext context) => const Reset(),
      //   'si1': (BuildContext context) => const Profile(),
      //   'si2': (BuildContext cotext) => const Subscription(),
      // },
    ));
void _startCountDown() {}
