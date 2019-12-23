import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_analog_clock/flutter_analog_clock.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Home(),
      ),
    );

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  File bgImage;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      bgImage = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.image),
        backgroundColor: Color.fromARGB(128, 0, 0, 0),
        onPressed: getImage,
      ),
      body: Container(
        child: Stack(
          children: <Widget>[
            Container(
                height: size.height,
                width: size.width,
                child: bgImage == null
                    ? Image(
                        image: AssetImage('images/bg.jpg'),
                        fit: BoxFit.cover,
                      )
                    : Image(
                        image: FileImage(bgImage),
                        fit: BoxFit.cover,
                      )),
            Container(
              color: Colors.transparent,
              child: Center(
                child: FlutterAnalogClock(
                  dateTime: DateTime.now(),
                  dialPlateColor: Color.fromARGB(128, 0, 0, 0),
                  hourHandColor: Colors.white,
                  minuteHandColor: Colors.white,
                  secondHandColor: Colors.red,
                  numberColor: Colors.white,
                  borderColor: Colors.white,
                  tickColor: Colors.white,
                  centerPointColor: Colors.white,
                  showBorder: true,
                  showTicks: true,
                  showMinuteHand: true,
                  showSecondHand: true,
                  showNumber: true,
                  borderWidth: 2.0,
                  hourNumberScale: 0.7,
                  hourNumbers: [
                    'I',
                    'II',
                    'III',
                    'IV',
                    'V',
                    'VI',
                    'VII',
                    'VIII',
                    'IX',
                    'X',
                    'XI',
                    'XII'
                  ],
                  isLive: true,
                  width: size.width * 0.7,
                  height: size.height * 0.7,
                  decoration: const BoxDecoration(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
