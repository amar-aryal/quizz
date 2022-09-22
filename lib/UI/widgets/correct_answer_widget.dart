import 'dart:math';

import 'package:flutter/material.dart';

class CorrectAnswerWidget extends StatefulWidget {
  const CorrectAnswerWidget({
    Key? key,
    required this.displayText,
  }) : super(key: key);
  final String displayText;

  @override
  State<CorrectAnswerWidget> createState() => _CorrectAnswerWidgetState();
}

class _CorrectAnswerWidgetState extends State<CorrectAnswerWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;
  AnimationStatus _status = AnimationStatus.dismissed;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));

    _animation = Tween(end: 1.0, begin: 0.0).animate(_controller)
      ..addStatusListener((status) {
        _status = status;
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        if (_status == AnimationStatus.dismissed) {
          _controller.forward();
        } else {
          _controller.reverse();
        }
      },
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, _) {
          return Transform(
            alignment: FractionalOffset.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.0015)
              ..rotateY(pi * _animation.value),
            child: Container(
              width: size.width * 0.8,
              height: size.height * 0.15,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    offset: const Offset(
                      2.0,
                      2.0,
                    ),
                  ),
                ],
              ),
              child: Center(
                child: _animation.value <= 0.5
                    ? Text(
                        'Correct Answer',
                        style: Theme.of(context).textTheme.headline5!.copyWith(
                              color: Colors.grey,
                            ),
                      )
                    : Transform(
                        alignment: FractionalOffset.center,
                        transform: Matrix4.identity()..rotateY(pi),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 15,
                          ),
                          child: Text(
                            widget.displayText,
                          ),
                        ),
                      ),
              ),
            ),
          );
        },
      ),
    );
  }
}
