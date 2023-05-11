import 'package:calculator_app/Calc/calculator_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        title: 'Calculator',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.blueAccent,
          brightness: Brightness.light,
          scaffoldBackgroundColor: Colors.white,
          fontFamily: GoogleFonts.robotoMono().fontFamily,
          textTheme: GoogleFonts.robotoMonoTextTheme(
            Theme.of(context).textTheme,
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),
          outlinedButtonTheme: OutlinedButtonThemeData(
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              side: const BorderSide(
                color: Colors.blueAccent,
              ),
            ),
          ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              foregroundColor: Colors.blueAccent,
            ),
          ),
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
              .copyWith(secondary: Colors.blueAccent),
        ),
        home: const CalculatorScreen(),
      );
    });
  }
}
