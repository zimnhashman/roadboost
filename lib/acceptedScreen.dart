import 'package:flutter/material.dart';
import 'requestScreen.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';


class Accept extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent[1000],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(
              'Help is on the way. Hang tight!',
              style: TextStyle(
                  fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.green),
            ),
          ),

    CircularCountDownTimer(
    duration: 1000,
    initialDuration: 10,
    controller: CountDownController(),
    width: MediaQuery.of(context).size.width / 2,
    height: MediaQuery.of(context).size.height / 2,
    ringColor: Colors.lightBlueAccent,
    ringGradient: null,
    fillColor: Colors.lightGreenAccent,
    fillGradient: null,
    backgroundColor: Colors.purple[500],
    backgroundGradient: null,
    strokeWidth: 20.0,
    strokeCap: StrokeCap.round,
    textStyle: TextStyle(
    fontSize: 33.0, color: Colors.white, fontWeight: FontWeight.bold),
    textFormat: CountdownTextFormat.S,
    isReverse: true,
    isReverseAnimation: false,
    isTimerTextShown: true,
    autoStart: true,
    onStart: () {
    print('Countdown Started');
    },
    onComplete: () {
    print('Countdown Ended');
    },
    ),


          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Request()));
              },
              child: Text('OKAY'))
        ],
      ),
    );
  }
}
