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
        title: Text(
          question.category,
        ),
        elevation: 0,
      ),
      body: ValueListenableBuilder(
          valueListenable: optionSelecedNotifier,
          builder: (context, value, _) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 30,
                    ),
                    child: Text(
                      question.question,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                    ),
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
                  const SizedBox(height: 30),
                  TextButton(
                    onPressed:
                        optionSelecedNotifier.value ? onDonePressed : null,
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
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
                            isLastPage ? 'Done' : 'Next',
                            style: Theme.of(context).textTheme.button!.copyWith(
                                  color: Colors.green,
                                  fontSize: 16,
                                ),
                          ),
                          const Icon(
                            Icons.arrow_forward,
                            color: Colors.green,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
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
      child: Wrap(
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
            maxLines: null,
            overflow: TextOverflow.visible,
            style: TextStyle(
              color: selectedColor != null ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
