import 'package:flutter/material.dart';
import 'package:textfild/repassword.dart';
import 'package:textfild/reset.dart';
import 'package:textfild/signup.dart';
import 'package:textfild/textfild.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const TextFild(),
      routes: <String, WidgetBuilder>{
        'register': (BuildContext context) => const TextFild(),
        'signup': (BuildContext context) => const Signup(),
        'sig': (BuildContext context) => const Repasssword(),
        'si': (BuildContext context) => const Reset(),
      },
    ));
//hh