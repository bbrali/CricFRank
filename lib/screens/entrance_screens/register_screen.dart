import 'package:cricf_rank/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:cricf_rank/screens/entrance_screens/entrance_screen_ui.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class RegisterScreen extends StatefulWidget {
  static const String id = '/register_screen';

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String userEmail;
  String userPassword;

  bool isInAsyncCall = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isInAsyncCall,
      progressIndicator: CircularProgressIndicator(
        strokeWidth: 1.5,
        backgroundColor: Color(0xFFFF5722),
      ),
      color: Color(0xFFB2EBF2),
      child: EntranceScreenUI(
        passwordHintText: 'Type new password...',
        buttonText: 'Register',
        onEmailChanged: (valueChanged) {
          userEmail = valueChanged;
        },
        onPasswordChanged: (valueChanged) {
          userPassword = valueChanged;
        },
        onButtonPress: () async {
          // Implement the Register functionality.
          setState(() {
            isInAsyncCall = true;
          });
          try {
            final UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: userEmail, password: userPassword);
            Navigator.pushNamed(
              context,
              HomeScreen.id,
            );
          } catch (e) {
            print(e);
          } finally {
            setState(() {
              isInAsyncCall = false;
            });
          }
        },
        isLoginScreen: false,
      ),
    );
  }
}
