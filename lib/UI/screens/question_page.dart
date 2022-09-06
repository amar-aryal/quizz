import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:quizz/core/models/question.dart';

class QuestionPage extends HookWidget {
  const QuestionPage({
    Key? key,
    required this.question,
    required this.onDonePressed,
    this.isLastPage = false,
  }) : super(key: key);

  final Question question;
  final VoidCallback onDonePressed;
  final bool isLastPage;

  @override
  Widget build(BuildContext context) {
    final optionSelecedNotifier = useValueNotifier(false);
    final options = [
      ...[question.correctAnswer],
      ...question.incorrectAnswers
    ]..shuffle();

    final tappedList = options.map((e) => false).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(question.category),
      ),
      body: ValueListenableBuilder(
          valueListenable: optionSelecedNotifier,
          builder: (context, value, _) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text(question.question),
                ),
                ...options.map(
                  (e) => GestureDetector(
                    onTap: () {
                      if (optionSelecedNotifier.value) return;

                      optionSelecedNotifier.value = true;
                      // final indexOfSelected = options.indexOf(e);
                      // TODO: replace with simpler logic if possible
                      tappedList[options.indexOf(e)] = true;
                    },
                    child: OptionItem(
                      option: e,
                      selectedColor: !optionSelecedNotifier.value ||
                              !tappedList[options.indexOf(
                                  e)] // checking tapped or not for color assignment
                          ? null
                          : e == question.correctAnswer
                              ? Colors.green
                              : Colors.red,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: onDonePressed,
                  child: Text(isLastPage ? 'Done' : 'Next'),
                )
              ],
            );
          }),
    );
  }
}

class OptionItem extends StatelessWidget {
  const OptionItem({
    Key? key,
    required this.option,
    this.selectedColor,
  }) : super(key: key);

  final String option;
  final Color? selectedColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
          color: selectedColor,
          border: Border.all(color: Colors.grey),
          borderRadius: const BorderRadius.all(
            Radius.circular(25),
          )),
      child: Row(
        children: [
          if (selectedColor != null) ...[
            Icon(
              selectedColor == Colors.green ? Icons.check : Icons.close,
              color: Colors.white,
            ),
            const SizedBox(width: 5),
          ],
          Text(
            option,
            style: TextStyle(
              color: selectedColor != null ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
