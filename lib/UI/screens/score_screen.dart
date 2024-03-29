import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quizz/UI/screens/question_screen.dart';
import 'package:quizz/UI/widgets/animations/score_calculating_animation.dart';
import 'package:quizz/utils/constants.dart';

class ScoreScreen extends HookConsumerWidget {
  const ScoreScreen({Key? key, required this.totalQuestions}) : super(key: key);

  final int totalQuestions;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final score = ref.watch(scoreProvider.notifier).state;
    final calculating = useValueNotifier(true);
    Future.delayed(const Duration(seconds: 3), () {
      calculating.value = false;
    });
    return WillPopScope(
      onWillPop: () async {
        ref.watch(scoreProvider.notifier).state = 0;
        return true;
      },
      child: Scaffold(
        backgroundColor: scaffoldColor,
        body: ValueListenableBuilder(
          valueListenable: calculating,
          builder: (context, value, _) {
            return AnimatedCrossFade(
              firstChild: const ScoreCalulationAnimaton(),
              secondChild: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '$score',
                          style: Theme.of(context).textTheme.displayLarge,
                        ),
                        Text(
                          '/$totalQuestions',
                          style: Theme.of(context).textTheme.displayLarge,
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    TextButton(
                      onPressed: () {
                        ref.watch(scoreProvider.notifier).state = 0;
                        Navigator.pop(context);
                      },
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                            side: const BorderSide(color: Colors.green),
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Finish',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(
                                    color: Colors.green,
                                    fontSize: 16,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              crossFadeState: calculating.value
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              duration: const Duration(seconds: 1),
            );
          },
        ),
      ),
    );
  }
}
