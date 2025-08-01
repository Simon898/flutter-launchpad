import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget
{
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
  // Widget build(BuildContext context)
}

class _MyAppState extends State<MyApp>
{
   @override
  Widget build(BuildContext context)
{
    return  MaterialApp(
      title: 'Launch Pad',
      home:SafeArea(
        child: Scaffold(
           appBar: AppBar(
            backgroundColor: Colors.tealAccent,
            // title: Text('$count'),
            title: Text('Launch Pad',
            style: GoogleFonts.orbitron()),
          ),
          body:
          Center(
            child: Wrap(
              spacing: 6.0,
              runSpacing: 6.0,
              children:[
                Pad(Color(0xffADCBFC), Color(0xff067CCB), '1.mp3'),
                Pad(Color.fromARGB(255, 172, 56, 187), Color.fromARGB(255, 181, 125, 203), '2.mp3'),
                Pad(Color.fromARGB(255, 103, 127, 165), Color.fromARGB(255, 134, 140, 145), '3.mp3'),
                Pad(Color.fromARGB(255, 213, 230, 80), Color.fromARGB(255, 182, 192, 135), '4.mp3'),
                Pad(Color(0xffADCBFC), Color(0xff067CCB), '5.mp3'),
                Pad(Color.fromARGB(255, 172, 56, 187), Color.fromARGB(255, 181, 125, 203), '6.mp3'),
                Pad(Color.fromARGB(255, 103, 127, 165), Color.fromARGB(255, 134, 140, 145), '7.mp3'),
                Pad(Color.fromARGB(255, 213, 230, 80), Color.fromARGB(255, 182, 192, 135), '8.mp3'),
                Pad(Color(0xffADCBFC), Color(0xff067CCB), '9.mp3'),
                Pad(Color.fromARGB(255, 172, 56, 187), Color.fromARGB(255, 181, 125, 203), '10.mp3'),
                Pad(Color.fromARGB(255, 103, 127, 165), Color.fromARGB(255, 134, 140, 145), '11.mp3'),
                Pad(Color.fromARGB(255, 213, 230, 80), Color.fromARGB(255, 182, 192, 135), '12.mp3'),
                Pad(Color(0xffADCBFC), Color(0xff067CCB), '13.mp3'),
                Pad(Color.fromARGB(255, 172, 56, 187), Color.fromARGB(255, 181, 125, 203), '14.mp3'),
                Pad(Color.fromARGB(255, 103, 127, 165), Color.fromARGB(255, 134, 140, 145), '15.mp3'),
                Pad(Color.fromARGB(255, 213, 230, 80), Color.fromARGB(255, 182, 192, 135), '16.mp3')
              ]
              ),
          ),
        ),
      ),);
}
}

class Pad extends StatefulWidget {
  final colorCenter;
  final colorOutline;
  final note;

  const Pad(this.colorCenter,this.colorOutline, this.note,{Key? key}) : super(key: key);

  @override
  State<Pad> createState() => _PadState();
}

class _PadState extends State<Pad> {
  late Color _colorCenter;
  late Color _colorOutline;
  final player = AudioPlayer();
  @override
  void initState() {
    _colorCenter=widget.colorCenter;
    _colorOutline = widget.colorOutline;
    super.initState();
  }
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () async{
        setState(() {
        _colorCenter = Colors.white;
        _colorOutline = Colors.white;
        player.play(AssetSource(widget.note));
      });
      await Future.delayed(Duration(microseconds: 500));
       setState(() {
        _colorCenter = widget.colorCenter;
        _colorOutline = widget.colorOutline;
      });
      },
      child: Container(
        height: deviceHeight/8.2,
        width: deviceWidth/4.3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(6.0)),
          gradient: RadialGradient(colors: [_colorCenter,_colorOutline],
          radius: 0.5)
        ),
      ),
    );
  }
}