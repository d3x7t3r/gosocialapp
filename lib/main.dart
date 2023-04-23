import 'package:flutter/material.dart';
import 'package:gosocial/screens/editprofile_page.dart';
import 'package:gosocial/screens/feedback_page.dart';
import 'package:gosocial/screens/homepage.dart';
import 'package:gosocial/screens/about_page.dart';
import 'package:gosocial/screens/contacts_page.dart';
import 'package:gosocial/screens/login_page.dart';
import 'package:gosocial/screens/profile_page.dart';
import 'package:gosocial/screens/settings_page.dart';
import 'package:gosocial/screens/splash_screen.dart';
import 'dart:async';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  final TextEditingController emailController;
  final TextEditingController passwordController;
  MyApp({Key? key})
      : emailController = TextEditingController(text: 'mnengaally6@gmail.com'),
        passwordController = TextEditingController(text: '12345'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/about': (context) => const AboutPage(),
        '/homepage': (context) => const HomePage(),
        '/contacts': (context) => const ContactsPage(),
        '/profile':(context)=> const ProfilePage(),
        '/editprofile':(context)=> const EditProfilePage(),
        '/sendfeedback':(context)=> const FeedbackPage(),
        '/settings':(context)=> const SettingsPage(),
        '/logout':(context)=> const LoginPage()
        //'/splashscreen':(context)=> SplashScreen(),
      },
      debugShowCheckedModeBanner: false,
      title: 'GoSocialAppLogin',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 50),
            backgroundColor: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            textStyle: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: Colors.blue,
            textStyle: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          filled: true,
          fillColor: Colors.white.withOpacity(0.7),
          labelStyle: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          hintStyle: const TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
      home: SplashScreen(
        seconds: 3,
        navigateAfterSeconds: const LoginPage(),
        title: const Text(
          'Welcome To GoSocialApp',
          style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
        loaderColor: Colors.white,
      ),
    );
  }
}
class SplashScreen extends StatefulWidget{
  final int seconds;
  final Widget navigateAfterSeconds;
  final Color backgroundColor;
  final Color loaderColor;
  final Text title;

  SplashScreen({
    required this.seconds,
    required this.navigateAfterSeconds,
    this.backgroundColor = Colors.white,
    this.loaderColor = Colors.green,
    required this.title
  });


  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _loadWidget();
  }

  _loadWidget() async {
    await Future.delayed(Duration(seconds: widget.seconds));
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => widget.navigateAfterSeconds));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/GoSocial_logo.png',
              width: 150,
              height: 150,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: widget.title,
            ),
            SizedBox(height: 20),
            CircularProgressIndicator(
              backgroundColor: Colors.white,
              valueColor: AlwaysStoppedAnimation<Color>(widget.loaderColor),
            ),
          ],
        ),
      ),
    );
  }
}