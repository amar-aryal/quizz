import 'package:flutter/material.dart';
import 'package:quizz/UI/category_utils.dart';
import 'package:quizz/UI/screens/question_screen.dart';
import 'package:quizz/UI/widgets/question_options_dialog.dart';

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
