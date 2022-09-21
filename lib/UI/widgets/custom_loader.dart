import 'dart:math';

import 'package:flutter/material.dart';

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
      ..addListener(() {
        setState(() {});
      })
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
    // return Transform(
    //   alignment: FractionalOffset.center,
    //   transform: Matrix4.identity()
    //     ..setEntry(3, 2, 0.0015)
    //     ..rotateY(pi * _animation.value),
    //   child: CustomPaint(
    //     painter: ShapePainter(),
    //     child: Container(),
    //   ),
    // );
    //* for rotating animation
    return RotationTransition(
      alignment: FractionalOffset.center,
      turns: _controller,
      child: CustomPaint(
        painter: ShapePainter(),
        child: Container(),
      ),
    );
  }
}

class ShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.green
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round;

    final arcPaint = Paint()
      ..color = Colors.green
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke;

    Offset centerPoint = Offset(size.width / 2, size.height / 2);

    canvas.drawCircle(centerPoint, 50, paint);

    canvas.drawArc(Rect.fromCircle(center: centerPoint, radius: 70), pi,
        pi * 0.5, false, arcPaint);

    canvas.drawArc(Rect.fromCircle(center: centerPoint, radius: 70), pi * 2,
        pi / 2, false, arcPaint);
  }

  double doubleToAngle(double angle) => angle * pi / 180.0;

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
