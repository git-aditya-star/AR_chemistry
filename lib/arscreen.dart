import 'package:ar/ar.dart';
import 'package:flutter/material.dart';
import 'test.dart';

class Arscreen extends StatefulWidget {
  final String comp;

  Arscreen({
    Key key,
    @required this.comp,
  }) : super(key: key);

  @override
  _ArscreenState createState() => _ArscreenState();
}

class _ArscreenState extends State<Arscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        title: Text('${widget.comp}'),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Color(0xFFcc99ff), Color(0xFFff99ff)]),
          ),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyApp()));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  margin: EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    color: Colors.cyan,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "Click to view in AR",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Card(
                elevation: 20,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                shadowColor: Colors.purple,
                margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Chemicals[widget.comp][0] +
                            '\n\n' +
                            Chemicals[widget.comp][1] +
                            '\n\n' +
                            Chemicals[widget.comp][2] +
                            '\n\n' +
                            Chemicals[widget.comp][3] +
                            '\n\n' +
                            Chemicals[widget.comp][4] +
                            '\n\n' +
                            Chemicals[widget.comp][5] +
                            '\n\n' +
                            Chemicals[widget.comp][6],
                        style: TextStyle(fontFamily: "serif", fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
