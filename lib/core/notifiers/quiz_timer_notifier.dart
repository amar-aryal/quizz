import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quizz/UI/screens/question_screen.dart';
import 'package:quizz/app_setup/app_models/base_state.dart';

final quizTimerControllerProvider =
    StateNotifierProvider.autoDispose<QuizTimerNotifier, BaseState>(
        quizTimerController);

QuizTimerNotifier quizTimerController(Ref ref) {
  return QuizTimerNotifier(ref.read);
}

class QuizTimerNotifier extends StateNotifier<BaseState> {
  QuizTimerNotifier(this._read) : super(const BaseState.initial());

  final Reader _read;
  Duration duration = const Duration(minutes: 1);

  late Timer timer;

  void setTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) => reduceDuration());
  }

  void reduceDuration() {
    final seconds = duration.inSeconds - 1;
    duration = Duration(seconds: seconds);

    if (seconds < 0) {
      cancelTimer();
      _read(progressProvider.notifier).state = 0;
      state = const BaseState.success();
    } else {
      state = BaseState.loading(data: duration);
    }
  }

  cancelTimer() {
    timer.cancel();
  }

  Duration get getDuration => duration;
}
