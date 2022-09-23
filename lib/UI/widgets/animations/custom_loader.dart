import 'dart:math';

import 'package:flutter/material.dart';
import 'package:quizz/utils/constants.dart';

class CustomLoader extends StatefulWidget {
  const CustomLoader({Key? key}) : super(key: key);

  @override
  State<CustomLoader> createState() => _CustomLoaderState();
}

class _CustomLoaderState extends State<CustomLoader>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));

    _animation = Tween(end: 1.0, begin: 0.0).animate(_controller)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.repeat();
        } else if (status == AnimationStatus.dismissed) {
          _controller.forward();
        }
      });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //* for flip animation
    // return AnimatedBuilder(
    //     animation: _controller,
    //     builder: (context, _) {
    //       return Transform(
    //         alignment: FractionalOffset.center,
    //         transform: Matrix4.identity()
    //           ..setEntry(3, 2, 0.0015)
    //           ..rotateY(pi * _animation.value),
    //         child: CustomPaint(
    //           painter: ShapePainter(),
    //           child: Container(),
    //         ),
    //       );
    //     });
    //* for rotating animation
    return RotationTransition(
      alignment: FractionalOffset.center,
      turns: _controller,
      child: CustomPaint(
        painter: _ShapePainter(),
        child: Container(),
      ),
    );
  }
}

class _ShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var circle1 = Paint()
      ..color = appBarColor
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round;

    final arcPaint = Paint()
      ..color = appBarColor
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke;

    var circle2 = Paint()
      ..color = Colors.blueGrey.shade100
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Offset centerPoint = Offset(size.width / 2, size.height / 2);

    canvas.drawCircle(centerPoint, 25, circle1);
    canvas.drawCircle(centerPoint, 40, circle2);

    canvas.drawArc(Rect.fromCircle(center: centerPoint, radius: 40), pi,
        pi * 0.5, false, arcPaint);

    canvas.drawArc(Rect.fromCircle(center: centerPoint, radius: 40), pi * 2,
        pi / 2, false, arcPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
