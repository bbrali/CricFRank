import 'package:flutter/material.dart';
import 'package:cricf_rank/screens/entrance_screens/login_screen.dart';
import 'package:cricf_rank/screens/entrance_screens/register_screen.dart';
import 'package:cricf_rank/screens/home_screen.dart';
import 'package:cricf_rank/screens/player_profile_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => LoginScreen(),
        RegisterScreen.id: (BuildContext context) => RegisterScreen(),
        HomeScreen.id: (BuildContext context) => HomeScreen(),
        PlayerProfileScreen.id: (BuildContext context) => PlayerProfileScreen(),
      },
    );
  }
}
