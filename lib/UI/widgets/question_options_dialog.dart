import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quizz/utils/constants.dart';

final timerOnProvider = StateProvider<bool>((_) => false);

class QuestionOptionsDialog extends HookConsumerWidget {
  //TODO: if timerOnProvider is to be refreshed, then set it to false on initstate here
  //TODO: or when finish btn is clicked reset its value (this is more convenient)
  const QuestionOptionsDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timerOn = ref.watch(timerOnProvider);
    int? totalQuestions;
    final timerOnNotifier = useValueNotifier(timerOn);

    return AlertDialog(
      title: const Text('Total questions'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('How many questions would you like to answer?'),
          const SizedBox(height: 20),
          ValueListenableBuilder(
              valueListenable: timerOnNotifier,
              builder: (_, bool timerOnValue, __) {
                return Row(
                  children: [
                    const Text('Timer:'),
                    Switch.adaptive(
                      value: timerOnValue,
                      activeColor: appBarColor,
                      onChanged: (value) {
                        timerOnNotifier.value = value;
                        ref.read(timerOnProvider.notifier).state = value;
                      },
                    ),
                  ],
                );
              }),
          const SizedBox(height: 10),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              ...[5, 10, 20, 30].map(
                (e) => InkWell(
                  onTap: () {
                    totalQuestions = e;
                    Navigator.pop(context, totalQuestions);
                  },
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: appBarColor,
                    child: Text(
                      '$e',
                      style: Theme.of(context).textTheme.headline5!.copyWith(
                            color: Colors.white,
                          ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          style: TextButton.styleFrom(
            textStyle: Theme.of(context).textTheme.labelLarge,
          ),
          child: const Text('Close'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
