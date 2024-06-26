import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:textfild/main_page/home_page.dart';
import 'package:textfild/textfild.dart';

class Signup extends StatefulWidget {
  late String jwttokken;
  Signup({super.key, required this.jwttokken});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // ignore: prefer_typing_uninitialized_variables
  var _name;
  var _email;
  var _mobileNumber;
  var _Password;
  var _ConfirmPassword;

  // ignore: non_constant_identifier_names
  // Widget Textformes(
  //     String hintText, Icon icon, String fildname, String saveVaribale) {
  //   return Padding(
  //     padding: const EdgeInsets.all(40),
  //     child: TextFormField(
  //       decoration: InputDecoration(hintText: hintText, prefixIcon: icon),
  //       validator: (text) {
  //         if (text == null) {
  //           return "${fildname}Can not be Emty";
  //         }
  //         return null;
  //       },
  //       onSaved: (text) {
  //         saveVaribale = text!;
  //       },
  //     ),
  //   );
  // }
  void signup(
    String name,
    password,
    email,
  ) async {
    var url = Uri.http('10.0.2.2:8080', 'sign-up');
    try {
      var response = await http.post(url, body: {
        'userName': name,
        'userEmail': email,
        'userMobileNo': '0754806795',
        'userPassword': password,
        "userRole": 'ROLE_USER'
      });
      if (response.statusCode == 200) {
        print("sucsess fully registation");
      }
    } catch (e) {
      e.toString();
    }
  }

  void okay(String name, email, moblenumber, password, role) async {
    var url = Uri.http('10.0.2.2:8080', 'sign-up');
    try {
      var response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json', // Update content type
        },
        body: jsonEncode({
          'userName': name,
          'userEmail': email,
          'userMobileNo': moblenumber,
          'userPassword': password,
          'userRole': role
        }),
      );

      if (response.statusCode == 200) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const TextFild()),
        );
      } else {
        print("Registration failed with status code: ${response.statusCode}");
      }
    } catch (e) {
      print("Error during registration: $e");
    }
  }

  bool Passwordcheck() {
    if (_Password == _ConfirmPassword) {
      return true;
    }
    return false;
  }

  Widget h(String hintText, Icon icon, String fildname,
      Function(String) updatevaribale, TextEditingController controller) {
    return Container(
      padding: const EdgeInsets.all(0),
      margin: const EdgeInsets.all(16),
      child: TextFormField(
        decoration: InputDecoration(hintText: hintText, prefixIcon: icon),
        validator: (text) {
          if (text == null || text.isEmpty) {
            return "${fildname}" + " " + "Can not be Emty";
          }
          return null;
        },
        controller: controller,
        onSaved: (text) {
          updatevaribale(text!);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController name = TextEditingController();
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    TextEditingController mobile = TextEditingController();
    TextEditingController role = TextEditingController();
    TextEditingController conpassword = TextEditingController();

    //TextEditingController mobile_number = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Image.asset(
            'assets/sign.jpg',
            height: 150,
            width: double.infinity,
          ),
          const SizedBox(
            height: 15,
          ),
          const Row(
            children: [
              Text(
                "Sign Up",
                style: TextStyle(fontSize: 38, fontWeight: FontWeight.w400),
              )
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  h("Name", const Icon(Icons.person), "Name",
                      (text) => _name = text, name),
                  h("email", const Icon(Icons.email), "Email", (text) {
                    _email = text;
                  }, email),
                  h("Password", const Icon(Icons.password), "Password",
                      (p0) => _Password = p0, password),
                  h(
                      "Confirm Password",
                      const Icon(Icons.text_decrease),
                      "Confirm Password",
                      (p0) => _ConfirmPassword = p0,
                      conpassword),
                  Container(
                    margin: const EdgeInsets.all(2),
                    padding: const EdgeInsets.all(5),
                    child: InternationalPhoneNumberInput(
                        onInputChanged: (value) =>
                            mobile.text = value.toString()),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();

                            if (!Passwordcheck()) {
                              showDialog(
                                  context: context,
                                  builder: (contex) {
                                    return AlertDialog(
                                      title: const Text("About Password Fild"),
                                      content:
                                          const Text("password do not match"),
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: const Text("OK"))
                                      ],
                                    );
                                  });
                            } else {
                              okay(
                                  name.text.toString(),
                                  email.text.toString(),
                                  mobile.text.toString(),
                                  password.text.toString(),
                                  'non-premium-user');
                            }
                          }
                        },
                        child: const Text(
                          "submit",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w400),
                        )),
                  )
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
