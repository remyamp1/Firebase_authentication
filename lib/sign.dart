import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_userauthentication/forgotpassword.dart';
import 'package:firebase_userauthentication/login.dart';
import 'package:flutter/material.dart';

class SignPage extends StatefulWidget {
  const SignPage({super.key});

  @override
  State<SignPage> createState() => _SignPageState();
}

class _SignPageState extends State<SignPage> {
  TextEditingController _emaliController=TextEditingController();
  TextEditingController _passwordController=TextEditingController();

  Future<void> _signUp()async{
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _emaliController.text.trim(),
       password: _passwordController.text.trim());
       print("User signed up");
    } catch (e) {
      print("Sign-Up error:$e");
    }
  }

  void _showErrorDialog(String message){
    showDialog(context: context, builder: (context)=>AlertDialog(
      title: Text("Error"),
      content: Text("Message"),
      actions: [
        TextButton(onPressed: (){
          Navigator.of(context).pop();
        }, child: Text("Ok"))
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
              height: 350,
              width: 400,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/signup.jpeg"),
                      fit: BoxFit.cover)),
            ),
            SizedBox(height: 40),
            SizedBox(
                height: 50,
                width: 300,
                child: TextField(
                  controller: _emaliController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), label: Text("Email")),
                )),
            SizedBox(
              height: 20,
            ),
            SizedBox(
                height: 50,
                width: 300,
                child: TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), label: Text("Password")),
                )),
            SizedBox(height: 50),
            ElevatedButton(
                onPressed: () {
                  _signUp();
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>LoginPage()));
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 110, 110, 109),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                child: Center(
                  child: Text(
                    "Sign Up",
                    style: TextStyle(color: Colors.black),
                  ),
                )),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Already have an account?"),
                SizedBox(
                  width: 7,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>LoginPage()));
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(
                        color: const Color.fromARGB(255, 110, 110, 109)),
                  ),
                )
              ],
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgotpasswordPage()));              },
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
