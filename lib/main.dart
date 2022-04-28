import 'package:flutter/material.dart';

//main() => runApp(
//  Container(
//    color: Color(0xFF444444),
//    child: Center(
//      child: Directionality(
//        textDirection: TextDirection.ltr,      
//        // child: Text("Hello,  World!!!",
//        //   style: TextStyle(
//        //     color: Color(0xFFFD620A),
//        //     fontSize: 32.0,
//        //   ),
        
//        // child: MyStatelessWidget("Skyhero"),

//        // child: MyButtonWidget(),
//        child: Counter(),
//      ),
//    ),
//  ),
//);

main() => runApp(App());


// FIRST STATELESS WIDGET
class MyStatelessWidget extends StatelessWidget {

  final String name;
  MyStatelessWidget(this.name);

  @override
  Widget build(BuildContext context) {
    return Text("LOL!!, who is $name!",
      style: TextStyle(
        color: Color(0xFFFD620A),
      )
    );
  }
}

// FIRST STATELESS WIDGET WITH GESTURE DETECTION
class MyButtonWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          print("The Button is pressed");
        },
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFF17A2B8),
          ),
          width: 50,
          height: 50,
        ),
      ),
    );
  }
}

// FIRST STATEFUL WIDGET
class Counter extends StatefulWidget {

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {

  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          setState(() {
            counter += 1;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFF17A2B8),
          ),
          width: 80,
          height: 80,
          child: Text("$counter",
            style: TextStyle(fontSize: 60),  
          ),
        ),
      ),
    );
  }
}

// FOOTBALL SCORE COUNTER

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 60,
          horizontal: 80,
        ),
        color: Color(0xFFFFFFFF),
        child: Content(),
      ),
    );
  }
}

class Content extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Score('Manchester United'),
        Score('Juventus'),
      ],
    );
  }
}

class Score extends StatefulWidget {

  final String _name;
  Score(this._name);

  @override
  State<Score> createState() => _ScoreState();
}

class _ScoreState extends State<Score> {

  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom:10),
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFFFD6A02)),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _ScoreLabel(widget._name),
          _ScoreButton(
            count,
            onPressed: () {
              setState: (() {
                count +=1;
              });
            },
          ),
        ],
      ),
    );
  }
}


class _ScoreLabel extends StatelessWidget {
  
  static const textStyle = TextStyle(
    color: Color(0xFF000000),
    fontSize: 26,
  );


  final String _label;
  _ScoreLabel(this._label);

  @override
  Widget build(BuildContext context) {
    return Text(_label, style: _ScoreLabel.textStyle,);
  }
}

class _ScoreButton extends StatelessWidget {

  final count;
  final onPressed;

  _ScoreButton(this.count, {@required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 6.0),
        decoration: BoxDecoration(
          color: Color(0xFFFD6A02),
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: Center(
          child: Text("$count",
            style: TextStyle(fontSize: 20.0),
          ),
        ),
      ),
    );
  }
}

