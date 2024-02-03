import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

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
  bool Passwordcheck() {
    if (_Password == _ConfirmPassword) {
      return true;
    }
    return false;
  }

  Widget h(String hintText, Icon icon, String fildname,
      Function(String) updatevaribale) {
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
        onSaved: (text) {
          updatevaribale(text!);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Column(children: [
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
                    (text) => _name = text),
                h("email", const Icon(Icons.email), "Email", (text) {
                  _email = text;
                }),
                h("Password", const Icon(Icons.password), "Password",
                    (p0) => _Password = p0),
                h("Confirm Password", const Icon(Icons.text_decrease),
                    "Confirm Password", (p0) => _ConfirmPassword = p0),
                Container(
                  margin: const EdgeInsets.all(2),
                  padding: const EdgeInsets.all(5),
                  child: InternationalPhoneNumberInput(
                      onInputChanged: (value) => _mobileNumber = value),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          print(_name);
                          print(_email);
                          print(_mobileNumber);
                          print(Passwordcheck());
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
                            // save data to data base
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
    );
  }
}
