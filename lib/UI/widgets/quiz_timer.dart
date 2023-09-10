import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quizz/UI/screens/score_screen.dart';
import 'package:quizz/app_setup/app_models/base_state.dart';
import 'package:quizz/core/notifiers/quiz_timer_notifier.dart';
import 'package:quizz/utils/constants.dart';

class QuizTimer extends ConsumerStatefulWidget {
  final int totalQuestions;
  const QuizTimer({Key? key, required this.totalQuestions}) : super(key: key);

  @override
  ConsumerState<QuizTimer> createState() => _QuizTimerState();
}

class _QuizTimerState extends ConsumerState<QuizTimer> {
  @override
  void initState() {
    super.initState();
    ref.read(quizTimerControllerProvider.notifier).setTimer();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    ref.listen<BaseState>(
      quizTimerControllerProvider,
      (previous, state) {
        state.maybeWhen(
          orElse: () {},
          loading: (data) {},
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

    return ref.watch(quizTimerControllerProvider).maybeMap(
      orElse: () {
        return const SizedBox();
      },
      loading: (data) {
        final duration = data.data as Duration;
        final minutes =
            duration.inMinutes.remainder(60).toString().padLeft(2, '0');
        final seconds =
            duration.inSeconds.remainder(60).toString().padLeft(2, '0');

        return WillPopScope(
          onWillPop: () async {
            ref.read(quizTimerControllerProvider.notifier).cancelTimer();
            return true;
          },
          child: CircleAvatar(
            minRadius: size.height * 0.03,
            backgroundColor: Colors.white,
            child: Text(
              '$minutes:$seconds',
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: duration.inMinutes == 0 && duration.inSeconds < 10
                        ? Colors.red
                        : appBarColor,
                    fontSize: 18,
                  ),
            ),
          ),
        );
      },
    );
  }
}
