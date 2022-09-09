import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CorrectAnswerWidget extends StatelessWidget {
  const CorrectAnswerWidget({
    Key? key,
    required this.displayText,
    this.isFront = false,
  }) : super(key: key);
  final String displayText;
  final bool isFront;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      key: isFront ? const ValueKey(true) : const ValueKey(false),
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
        child: Text(
          displayText,
          style: isFront
              ? Theme.of(context).textTheme.headline5!.copyWith(
                    color: Colors.grey,
                  )
              : Theme.of(context).textTheme.subtitle1,
        ),
      ),
    );
  }
}

class FlipWidget extends HookWidget {
  const FlipWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _flipNotifier = ValueNotifier(false);
    return ValueListenableBuilder(
      valueListenable: _flipNotifier,
      builder: (context, value, _) {
        return GestureDetector(
          onTap: () {
            _flipNotifier.value = !_flipNotifier.value;
          },
          child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 600),
              child: _flipNotifier.value
                  ? const CorrectAnswerWidget(
                      displayText: 'Correct answer',
                      isFront: true,
                    )
                  : const CorrectAnswerWidget(
                      displayText: 'Answer',
                    )),
        );
      },
    );
  }
}
