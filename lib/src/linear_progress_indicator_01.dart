import 'package:flutter/material.dart';

class LinearProgressIndicator01 extends StatefulWidget {
  @override
  _LinearProgressIndicator01State createState() =>
      _LinearProgressIndicator01State();
}

class _LinearProgressIndicator01State extends State<LinearProgressIndicator01>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation animation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 60),
    )..addListener(() {
        setState(() {});
      });

    animation = Tween(begin: 0.0, end: 1.0).animate(animationController);

    animationController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(15.0),
        height: 100,
        child: CustomPaint(
          painter: Painter(animation.value),
        ),
      ),
    );
  }
}

class Painter extends CustomPainter {
  double percentage;

  Painter(this.percentage);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRRect(
      RRe
      Paint()
        ..color = Colors.blue
        ..strokeWidth = 50.0,
    );

    canvas.drawLine(
      Offset(0.0, size.height - 20),
      Offset(size.width * percentage, size.height - 20),
      Paint()
        ..color = Colors.blue
        ..strokeWidth = 50.0,
    );

    canvas.drawLine(
      Offset(size.width * percentage - 0.5, size.height - 65),
      Offset(size.width * percentage - 0.5, size.height - 45),
      Paint()
        ..color = Colors.green
        ..strokeWidth = 1.0,
    );

    canvas.drawRect(
      Rect.fromLTWH(size.width * percentage - 15, size.height - 82, 30, 20),
      Paint()
        ..color = Colors.green
        ..strokeWidth = 1.0,
    );

    TextSpan textSpan = TextSpan(
      text: '${(percentage * 100).round()}',
      style: TextStyle(color: Colors.black),
    );
    TextPainter textPainter = TextPainter(
      text: textSpan,
      textAlign: TextAlign.left,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    textPainter.paint(
      canvas,
      Offset(size.width * percentage - 8, size.height - 80),
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
