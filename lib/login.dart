import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_userauthentication/forgotpassword.dart';
import 'package:firebase_userauthentication/home.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emaliController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  Future<void> _sigin() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emaliController.text.trim(),
          password: _passwordController.text.trim());
      print("User signed in");
    } catch (e) {
      print("Sign-in error:$e");
      _showErrorDialog(e.toString());
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Error"),
              content: Text(message),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("Ok"))
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/login.jpeg"),
                      fit: BoxFit.cover)),
            ),
            SizedBox(height:40,),
            SizedBox(
                height: 50,
                width: 300,
                child: TextField(
                  controller: _emaliController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), label: Text("Email")),
                )),
            SizedBox(height:20,),
            SizedBox(
                height: 50,
                width: 300,
                child: TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), label: Text("Password")),
                )),
            SizedBox(height:15,),
            ElevatedButton(
                onPressed: () {
                  _sigin();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 75, 75, 74),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15))),
                child: Center(
                  child: Text(
                    "Login",
                    style: TextStyle(color: Colors.white),
                  ),
                )),
            SizedBox(height:10),
            SizedBox(height:10,),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ForgotpasswordPage()));
              },
              child: Text(
                "Forgot password?",
                style: TextStyle(color: Colors.blue),
              ),
            )
          ],
        ),
      ),
    );
  }
}
