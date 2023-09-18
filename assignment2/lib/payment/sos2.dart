import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ColoredCircle extends StatelessWidget {
  final Color color;
  final double diameter;

  ColoredCircle({
    required this.color,
    required this.diameter,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: diameter,
      height: diameter,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }
}

void main() => runApp(const Sos2());

class Sos2 extends StatelessWidget {
  const Sos2({Key? key}) : super(key: key);

  static const String _title = 'Sample App';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,debugShowCheckedModeBanner: false,
      home: Scaffold(
        //appBar: AppBar(title: const Text(_title)),
        body: const MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.all(10),
      child: ListView(children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
                onPressed: () {},
                icon: Icon(Icons.arrow_back_ios_new_outlined, size: 20)),
            SizedBox(
              width: 20,
            ),
            const Text(
              "SOS",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 18.0,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 100,
        ),
        Container(
            alignment: Alignment.topCenter,
            padding: const EdgeInsets.all(10),
            child: const Text(
              'Help is on the way',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            )),
        Container(
            width: 400.0,
            alignment: Alignment.topCenter,
            padding: const EdgeInsets.all(18),
            child: const Text(
              textAlign: TextAlign.center,
              //TEXT PART
              'Your current location has been shared \nwith emergency responders to ensure a\n swift response Your safety is our priority.',
              style: TextStyle(fontSize: 15, color: Color(0xff667085)),
            )),
        SizedBox(height: 100),
        Center(
          child: Stack(children: [
            ColoredCircle(
                color: Color.fromARGB(150, 237, 76, 92), diameter: 150.0),
            
            Positioned(
                top: 48.0,
                left: 35.0,
                child: Container(
                    child: Text('SOS', style: TextStyle(color: Colors.red,fontWeight: FontWeight.w600,fontSize: 40)))),
                    SizedBox(height: 100,),
                     
          ]),
          
        ),SizedBox(height: 80,),Align(child: Text("Cancel",style:TextStyle(fontWeight: FontWeight.w500,fontSize: 18 ,),),),
      ]),
    ));
  }
}
