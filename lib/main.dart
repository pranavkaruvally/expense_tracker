import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // defining the necessary color to use as primarySwatch for the application
  static const Map<int, Color> appColor = {
    50:Color.fromRGBO(44, 40, 59, 0.1),
    100:Color.fromRGBO(44, 40, 59, 0.2),
    200:Color.fromRGBO(44, 40, 59, 0.3),
    300:Color.fromRGBO(44, 40, 59, 0.4),
    400:Color.fromRGBO(44, 40, 59, 0.5),
    500:Color.fromRGBO(44, 40, 59, 0.6),
    600:Color.fromRGBO(44, 40, 59, 0.7),
    700:Color.fromRGBO(44, 40, 59, 0.8),
    800:Color.fromRGBO(44, 40, 59, 0.9),
    900:Color.fromRGBO(44, 40, 59, 1),
  };

  static const MaterialColor appColorCustom = MaterialColor(0xff2c283b, appColor);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Tracker',
      theme: ThemeData(
        primarySwatch: appColorCustom,
        scaffoldBackgroundColor: appColorCustom,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: const [
            Text(
              "December",
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.w700,
              ),
              ),
              Expanded(child: SizedBox()),
              Text(
              "Rs. 687",
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
      body: const Center(
        child: SizedBox(),
      ),
    );
  }
}
