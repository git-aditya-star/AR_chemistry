import 'package:ar/arscreen.dart';
import 'package:flutter/material.dart';

main(List<String> args) {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Ar chemistry",
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String comp;
  List<String> compound = [
    "Glycerol",
    "Aniline",
    "Phenol",
    "Chloroform",
    "Urea",
    "Oxalic acid"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      CustomPaint(
          painter: UserPainter(),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          )),
      Column(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(16, 60, 16, 70),
            child: Text(
              "AR Chemistry",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 35,
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Expanded(
            child: GridView.count(
              padding: EdgeInsets.symmetric(horizontal: 16),
              crossAxisCount: 2,
              mainAxisSpacing: 0.0,
              crossAxisSpacing: 10,
              children: List.generate(6, (index) {
                return GridTile(
                    child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Arscreen(comp: '${compound[index]}')));
                  },
                  child: Container(
                    margin: EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.blue,
                      gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [Color(0xFFcc99ff), Color(0xFFff99ff)]),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      '${compound[index]}',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ));
              }),
            ),
          )
        ],
      ),
    ]));
  }
}

class UserPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final height = size.height;
    final width = size.width;
    Paint paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    Paint paint1 = Paint();

    Path mainbackground = Path();
    mainbackground.addRect(Rect.fromLTRB(0, 0, width, height));

    Path ovalPath = Path();
    ovalPath.moveTo(0, height * 0.1);
    ovalPath.cubicTo(width * 0.05, height * 0.4, width * 0.95, height * 0.1,
        width, height * 0.4);
    ovalPath.lineTo(width, 0);
    ovalPath.lineTo(0, 0);
    ovalPath.close();

    paint1.color = Colors.deepPurple;
    paint.color = Colors.deepPurple;
    canvas.drawPath(ovalPath, paint);
    canvas.drawPath(ovalPath, paint1);
  }

  @override
  bool shouldRepaint(UserPainter oldDelegate) => false;
}
