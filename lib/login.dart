import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication/home.dart';
import 'package:flutter/material.dart';
class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email_controller = TextEditingController();
  TextEditingController password_controller = TextEditingController();
  final FirebaseAuth _auth= FirebaseAuth.instance;


  Future<void> loginUser()async{
    String email= email_controller.text.trim();
    String password= password_controller.text.trim();


  UserCredential userCredential= await _auth.createUserWithEmailAndPassword(email: email, password: password);
  User? user= userCredential.user;

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                controller: email_controller,
                decoration: InputDecoration(
                  hintText: 'email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: password_controller,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  onPressed: (){loginUser();},
                  child: Text('login'))
            ],
          ),
        ),
      ),
    );
  }
}
