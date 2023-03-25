import 'package:flutter/material.dart';
import 'package:proyek3_flutter/pages/awalan_page.dart';
import 'package:proyek3_flutter/pages/home/main_page.dart';
import 'package:proyek3_flutter/pages/sign_in_page.dart';
import 'package:proyek3_flutter/pages/sign_up_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => AwalanPage(),
        '/sign-in': (context) => SignInPage(),
        '/sign-up': (context) => SignUpPage(),
        '/home': (context) => MainPage(),
      },
    );
  }
}


