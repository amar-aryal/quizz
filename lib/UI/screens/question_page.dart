import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quizz/UI/screens/question_screen.dart';
import 'package:quizz/UI/widgets/correct_answer_widget.dart';
import 'package:quizz/core/models/question.dart';
import 'package:quizz/utils/constants.dart';

class QuestionPage extends HookConsumerWidget {
  const QuestionPage({
    Key? key,
    required this.question,
    required this.onDonePressed,
    this.isLastPage = false,
    required this.questions,
  }) : super(key: key);

  final Question question;
  final VoidCallback onDonePressed;
  final bool isLastPage;
  final List<Question> questions;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final currentWidth = ref.watch(progressProvider);
    final optionSelecedNotifier = useValueNotifier(false);
    final options = [
      ...[question.correctAnswer],
      ...question.incorrectAnswers
    ]..shuffle();

    final tappedList = options.map((e) => false).toList();

    return Scaffold(
      backgroundColor: scaffoldColor,
      appBar: AppBar(
        title: Text(
          question.category,
        ),
        elevation: 0,
        backgroundColor: appBarColor,
      ),
      body: ValueListenableBuilder(
          valueListenable: optionSelecedNotifier,
          builder: (context, value, _) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: size.height * 0.1),
                  Stack(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 15,
                        ),
                        width: size.width,
                        height: size.height * 0.01,
                        color: Colors.grey.shade300,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 15,
                        ),
                        width: currentWidth,
                        height: size.height * 0.01,
                        color: appBarColor,
                      ),
                    ],
                  ),
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
                        // TODO: replace with simpler logic if possible
                        tappedList[options.indexOf(e)] = true;

                        if (e == question.correctAnswer) {
                          ref.read(scoreProvider.notifier).state += 1;
                        }
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
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .copyWith(
                                  color: Colors.green,
                                  fontSize: 16,
                                ),
                          ),
                          if (!isLastPage)
                            const Icon(
                              Icons.arrow_forward,
                              color: Colors.green,
                            ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  CorrectAnswerWidget(
                    displayText: question.correctAnswer,
                  ),
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
