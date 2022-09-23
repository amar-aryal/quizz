import 'package:flutter/material.dart';
import 'package:quizz/utils/constants.dart';

class ScoreCalulationAnimaton extends StatefulWidget {
  const ScoreCalulationAnimaton({Key? key}) : super(key: key);

  @override
  State<ScoreCalulationAnimaton> createState() =>
      _ScoreCalulationAnimatonState();
}

class _ScoreCalulationAnimatonState extends State<ScoreCalulationAnimaton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late final Animation<double> _radiusInnerAnimation;
  late final Animation<double> _radiusOuterAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 900,
      ),
    )..repeat(reverse: true);

    _radiusInnerAnimation = Tween(begin: 30.0, end: 40.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.bounceIn));

    _radiusOuterAnimation = Tween(begin: 50.0, end: 60.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, _) {
          return CustomPaint(
            painter: _ShapePainter(
              radiusInner: _radiusInnerAnimation.value,
              radiusOuter: _radiusOuterAnimation.value,
            ),
            child: Container(),
          );
        },
      ),
    );
  }
}

class _ShapePainter extends CustomPainter {
  final double radiusInner;
  final double radiusOuter;

  const _ShapePainter({
    required this.radiusInner,
    required this.radiusOuter,
  });

  @override
  void paint(Canvas canvas, Size size) {
    var circle1 = Paint()
      ..color = appBarColor
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round;

    var circle2 = Paint()
      ..color = Colors.blueGrey.shade100
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    var circle3 = Paint()
      ..color = Colors.blueGrey.shade100
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Offset centerPoint = Offset(size.width / 2, size.height / 2);

    canvas.drawCircle(centerPoint, radiusInner, circle1);
    canvas.drawCircle(centerPoint, radiusOuter, circle2);
    canvas.drawCircle(centerPoint, radiusOuter + 20, circle3);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
