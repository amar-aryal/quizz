import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quizz/UI/screens/question_screen.dart';

class ScoreScreen extends HookConsumerWidget {
  const ScoreScreen({Key? key, required this.totalQuestions}) : super(key: key);

  final int totalQuestions;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final score = ref.watch(scoreProvider.notifier).state;
    return WillPopScope(
      onWillPop: () async {
        ref.watch(scoreProvider.notifier).state = 0;
        return true;
      },
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: Row(
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
          ),
        ),
      ),
    );
  }
}
