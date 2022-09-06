import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quizz/UI/screens/question_page.dart';
import 'package:quizz/UI/widgets/error_view.dart';
import 'package:quizz/core/controllers/questions_controller.dart';
import 'package:quizz/core/models/question.dart';

class QuestionScreen extends StatefulHookConsumerWidget {
  const QuestionScreen({
    Key? key,
    required this.category,
  }) : super(key: key);

  final MapEntry<String, List<dynamic>> category;

  @override
  ConsumerState<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends ConsumerState<QuestionScreen> {
  late final String categoryTag;
  @override
  void initState() {
    super.initState();
    categoryTag = widget.category.key
        .toLowerCase()
        .replaceAll(' ', '_')
        .replaceAll('&', 'and');
    ref
        .read(questionsNotifierProvider.notifier)
        .fetchQuestions(categoryTag: categoryTag);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: to display question one-by-one, use pageview
    final _pagesController = usePageController();
    return Scaffold(
      body: ref.watch(questionsNotifierProvider).maybeMap(
        orElse: () {
          return const SizedBox();
        },
        success: (s) {
          final questions = s.data as List<Question>;
          return PageView.builder(
            controller: _pagesController,
            itemCount: questions.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, i) {
              return QuestionPage(
                question: questions[i],
                isLastPage: questions[i] == questions.last,
                onDonePressed: () => questions[i] == questions.last
                    ? Navigator.pop(context)
                    : _pagesController.nextPage(
                        duration: const Duration(seconds: 1),
                        curve: Curves.easeInOut,
                      ),
              );
            },
          );
        },
        loading: (_) {
          // TODO: add custom loading indicator later
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
        error: (e) {
          return ErrorView(
              errorText: e.failure.reason,
              onPressed: () => ref
                  .read(questionsNotifierProvider.notifier)
                  .fetchQuestions(categoryTag: categoryTag));
        },
      ),
    );
  }
}
