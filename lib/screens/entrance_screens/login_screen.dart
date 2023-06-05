import 'package:cricf_rank/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:cricf_rank/screens/entrance_screens/entrance_screen_ui.dart';
import 'package:cricf_rank/screens/entrance_screens/register_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation curvedAnimation;
  Animation colourAnimation;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  String userEmail;
  String userPassword;

  bool isInAsyncCall = false;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );
    animationController.forward();

    curvedAnimation = CurvedAnimation(parent: animationController, curve: Curves.fastOutSlowIn);
    colourAnimation = ColorTween(begin: Color(0xFF0097A7), end: Color(0xDDFFFFFF)).animate(animationController);

    curvedAnimation.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isInAsyncCall,
      progressIndicator: CircularProgressIndicator(
        strokeWidth: 1.5,
        backgroundColor: Color(0xFFFF5722),
      ),
      color: Color(0xFFFFFFFF),
      child: EntranceScreenUI(
        logoIconWidth: curvedAnimation.value * 160,
        logoIconHeight: curvedAnimation.value * 160,
        titleAnimatedColour: colourAnimation.value,
        passwordHintText: 'Type your password...',
        onEmailChanged: (valueChanged) {
          userEmail = valueChanged;
        },
        onPasswordChanged: (valueChanged) {
          userPassword = valueChanged;
        },
        buttonText: 'Login',
        onButtonPress: () async {
          // Implement the Login functionality.
          setState(() {
            isInAsyncCall = true;
          });
          try {
            final UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: userEmail, password: userPassword);
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
        onRegisterButtonPress: () {
          // Show 'Register' screen.
          Navigator.pushNamed(
            context,
            RegisterScreen.id,
          );
        },
        isLoginScreen: true,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }
}
