import 'package:flutter/material.dart';
import 'package:quizz/UI/category_utils.dart';
import 'package:quizz/UI/screens/question_screen.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    Key? key,
    required this.category,
  }) : super(key: key);

  final MapEntry<String, List<dynamic>> category;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        GestureDetector(
          onTap: () async {
            final totalQuestions = await showDialog<int>(
              context: context,
              builder: (BuildContext context) {
                return const QuestionOptionsDialog();
              },
            );
            if (totalQuestions != null) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => QuestionScreen(
                    category: category,
                    limit: totalQuestions,
                  ),
                ),
              );
            }
          },
          child: CircleAvatar(
            radius: size.height * 0.04,
            backgroundColor: categoryColors(category.key),
            child: categoryIcon(category.key),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          category.key,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}

class QuestionOptionsDialog extends StatelessWidget {
  const QuestionOptionsDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int? totalQuestions;

    return AlertDialog(
      title: const Text('Choose total questions'),
      content: Column(
        children: [
          const Text('How many questions would you like to answer?'),
          InkWell(
            onTap: () {
              totalQuestions = 5;
              Navigator.pop(context, totalQuestions);
            },
            child: const Text('5'),
          ),
          InkWell(
            onTap: () {
              totalQuestions = 10;
              Navigator.pop(context, totalQuestions);
            },
            child: const Text('10'),
          ),
          InkWell(
            onTap: () {
              totalQuestions = 20;
              Navigator.pop(context, totalQuestions);
            },
            child: const Text('20'),
          ),
          InkWell(
            onTap: () {
              totalQuestions = 30;
              Navigator.pop(context, totalQuestions);
            },
            child: const Text('30'),
          ),
          InkWell(
            onTap: () {
              totalQuestions = 10;
              Navigator.pop(context, totalQuestions);
            },
            child: const Text('10'),
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
