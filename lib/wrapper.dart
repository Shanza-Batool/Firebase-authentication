import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication/home.dart';
import 'package:firebase_authentication/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshot){
          if(snapshot.hasData){
              return Home();
          }else{
            return Login();
          }
        },
      ),
    );
  }
}
