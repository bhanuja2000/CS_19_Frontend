import 'package:flutter/material.dart';

class TextFild extends StatefulWidget {
  const TextFild({Key? key}) : super(key: key);

  @override
  _TextFildState createState() => _TextFildState();
}

class _TextFildState extends State<TextFild> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    const EdgeInsets padding = EdgeInsets.only(top: 50);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: padding,
            child: Row(
              children: [
                Image.asset(
                  "assets/main.png",
                  width: 200,
                  height: 300,
                ),
                const Text(
                  "Good Morning",
                  style: TextStyle(
                    color: Colors.amber,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: const Row(
              children: [
                Text(
                  "Loging",
                  style: TextStyle(fontSize: 38, fontWeight: FontWeight.w700),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(25),
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                TextField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person_2),
                    hintText: 'User Name',
                  ),
                  autofocus: true,
                  cursorColor: Colors.blue,
                  onChanged: (text) {
                    print(text);
                  },
                ),
                const SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.password),
                    hintText: "Password",
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                      icon: Icon(
                        _isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                    ),
                  ),
                  obscureText: !_isPasswordVisible,
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 3, horizontal: 0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed('sig');
                    },
                    child: const Text(
                      'Forgete User Name Or Password',
                      style: TextStyle(
                        color: Color.fromRGBO(252, 108, 100, 20),
                        //decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: Container(
              width: 200,
              child: ElevatedButton(
                onPressed: () {},
                child: Text("Login"),
              ),
            ),
          ),
          const SizedBox(height: 30),
          Center(
            child: Container(
              width: 100,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.facebook),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      'assets/google.png',
                      height: 30,
                      width: 30,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 14),
          Center(
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('signup');
              },
              child: const Text(
                'New User? Registred',
                style: TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
