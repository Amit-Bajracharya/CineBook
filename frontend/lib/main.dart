import 'package:cinebooknew/home/homepage.dart';
import 'package:cinebooknew/landing_page.dart';
import 'package:cinebooknew/home/loginPage/pagelogin.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: const ColorScheme(
          brightness: Brightness.dark, 
          primary: Colors.amber, 
          onPrimary: Colors.white, 
          secondary: Color(0xFF1F1F1F), 
          onSecondary: Colors.white70, 
          error: Color(0xFFFF1744), 
          onError: Colors.white, 
          surface: Color(0xFF121212), 
          onSurface: Colors.white, 
        ),

        textTheme: GoogleFonts.poppinsTextTheme().copyWith(
          titleLarge: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
          bodyMedium: GoogleFonts.poppins(

            fontSize: 16
          )
        ),
      ),
      home: Homepage(),
    );
  }
}
