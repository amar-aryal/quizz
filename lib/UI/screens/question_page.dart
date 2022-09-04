import 'package:flutter/material.dart';
import 'package:quizz/core/models/question.dart';

class QuestionPage extends StatelessWidget {
  const QuestionPage({
    Key? key,
    required this.question,
    required this.onDonePressed,
  }) : super(key: key);

  final Question question;
  final VoidCallback onDonePressed;

  @override
  Widget build(BuildContext context) {
    final options = [
      ...[question.correctAnswer],
      ...question.incorrectAnswers
    ]..shuffle();
    return Scaffold(
      appBar: AppBar(
        title: Text(question.category),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Text(question.question),
          ),
          ...options.map((e) => OptionItem(option: e)),
          TextButton(onPressed: onDonePressed, child: const Text('Done'))
        ],
      ),
    );
  }
}

class OptionItem extends StatelessWidget {
  const OptionItem({Key? key, required this.option}) : super(key: key);

  final String option;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: const BorderRadius.all(
              Radius.circular(25),
            )),
        child: Text(option),
      ),
    );
  }
}
