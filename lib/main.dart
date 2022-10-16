import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;

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
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            child: const CustomPieChart(),
          ),
          Expanded(child: ListView(
                  children: const [
                    ListTile(
                      title: Text('Food and Drinks', style: TextStyle(color: Color(0xffd5d5d5))),
                      subtitle: Text('12 Transactions', style: TextStyle(color: Color(0xff75757a))),
                      trailing: Text('Rs. 280', style: TextStyle(color: Color(0xffd6d7d6))),
                    ),
                    ListTile(
                      title: Text('Entertainment', style: TextStyle(color: Color(0xffd5d5d5))),
                      subtitle: Text('5 Transactions', style: TextStyle(color: Color(0xff75757a))),
                      trailing: Text('Rs. 150', style: TextStyle(color: Color(0xffd6d7d6))),
                    ),
                    ListTile(
                      title: Text('Clothes and others', style: TextStyle(color: Color(0xffd5d5d5))),
                      subtitle: Text('12 Transactions', style: TextStyle(color: Color(0xff75757a))),
                      trailing: Text('Rs. 300', style: TextStyle(color: Color(0xffd6d7d6))),
                    ),
                  ]
                ),
          ),
        ],
      ),
    );
  }
}

int hostel=180, food=100, others=80;

class CustomPieChart extends StatefulWidget {
  const CustomPieChart({super.key});

  @override
  State<CustomPieChart> createState() => _CustomPieChartState();
}

class _CustomPieChartState extends State<CustomPieChart> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 300,
      child: CustomPaint(
        painter: PiePainter(),
      ),
    );
  }
}

class PiePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var totalCost = hostel + food + others;

    var pieGap = math.pi * 0.15;

    var hostelStartAngle = 5*math.pi/12;
    var hostelSweepAngle = (hostel/totalCost) * 2*math.pi - pieGap;
    var hostelArcColor = const Color(0xff6c57fa);

    var foodStartAngle = hostelStartAngle + hostelSweepAngle + pieGap;
    var foodSweepAngle = (food/totalCost) * 2*math.pi - pieGap;
    var foodArcColor = const Color(0xffd266f9);

    var othersStartAngle = foodStartAngle + foodSweepAngle + pieGap;
    var othersSweepAngle = (others/totalCost) * 2*math.pi - pieGap;
    var othersArcColor = const Color(0xfff2a259);

    var centerX = size.width / 2;
    var centerY = size.height / 2;
    var center = Offset(centerX, centerY);
    // var radius = math.min(centerX, centerY);

    // var myRect = const Rect.fromLTRB(0, 0, 200, 200);
    var myRect = Rect.fromCircle(center: center, radius: 100);
    // var myRoundedRect = RRect.fromRectAndRadius(myRect, const Radius.circular(2));

    final hostelBrush = Paint()
      ..color = hostelArcColor
      ..style = PaintingStyle.stroke
      ..strokeJoin = StrokeJoin.miter
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 40;

    final foodBrush = Paint()
      ..color = foodArcColor
      ..style = PaintingStyle.stroke
      ..strokeJoin = StrokeJoin.miter
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 40;

    final othersBrush = Paint()
      ..color = othersArcColor
      ..style = PaintingStyle.stroke
      ..strokeJoin = StrokeJoin.miter
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 40;

    canvas.drawArc(myRect, hostelStartAngle, hostelSweepAngle, false, hostelBrush);
    canvas.drawArc(myRect, foodStartAngle, foodSweepAngle, false, foodBrush);
    canvas.drawArc(myRect, othersStartAngle, othersSweepAngle, false, othersBrush);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}