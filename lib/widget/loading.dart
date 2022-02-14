import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:first/widget/mlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class loading extends StatefulWidget {
  const loading({Key? key}) : super(key: key);

  @override
  _loadingState createState() => _loadingState();
}

class _loadingState extends State<loading> {
  @override
  void initState() {
    // Navigator.push(context, MaterialPageRoute(builder: (context) => mlist()));
    // TODO: implement initState
    tomlist();
    super.initState();
  }

  tomlist() async {
    await Future.delayed(Duration(seconds: 2));
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => mlist()));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 1,
          child: Image.asset(
            "assets/image/posterrb.png",
            fit: BoxFit.cover,
          ),
          color: Colors.blue,
        ),
        Positioned(
          left: 150,
          bottom: 50,
          child: Padding(
            padding: const EdgeInsets.only(left: 18.0),
            child: SpinKitWave(
              itemBuilder: (BuildContext context, int index) {
                return DecoratedBox(
                  decoration: BoxDecoration(
                    color: index.isEven ? Colors.red : Colors.green,
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
