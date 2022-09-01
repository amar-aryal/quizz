import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quizz/UI/widgets/error_view.dart';
import 'package:quizz/core/controllers/questions_controller.dart';

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
    return Scaffold(
      body: ref.watch(questionsNotifierProvider).maybeMap(
        orElse: () {
          return const SizedBox();
        },
        loading: (_) {
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
