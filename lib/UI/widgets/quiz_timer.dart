import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quizz/UI/screens/score_screen.dart';
import 'package:quizz/app_setup/app_models/base_state.dart';
import 'package:quizz/core/notifiers/quiz_timer_notifier.dart';

class QuizTimer extends ConsumerStatefulWidget {
  final int totalQuestions;
  const QuizTimer({Key? key, required this.totalQuestions}) : super(key: key);

  @override
  ConsumerState<QuizTimer> createState() => _QuizTimerState();
}

class _QuizTimerState extends ConsumerState<QuizTimer> {
  //** issues: realtime time not updating */
  @override
  void initState() {
    super.initState();
    ref.read(quizTimerControllerProvider.notifier).setTimer();
  }

  @override
  void dispose() {
    ref.read(quizTimerControllerProvider.notifier).cancelTimer();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<BaseState>(
      quizTimerControllerProvider,
      (previous, state) {
        state.maybeWhen(
          orElse: () {},
          loading: () {},
          success: (data) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) =>
                    ScoreScreen(totalQuestions: widget.totalQuestions),
              ),
            );
          },
        );
      },
    );
    final duration =
        ref.watch(quizTimerControllerProvider.notifier).getDuration;
    final minutes = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    return Text(
      '$minutes:$seconds',
      style: Theme.of(context).textTheme.headline5!.copyWith(),
    );
  }
}
