import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quizz/UI/screens/question_page.dart';
import 'package:quizz/UI/screens/score_screen.dart';
import 'package:quizz/UI/widgets/animations/custom_loader.dart';
import 'package:quizz/UI/widgets/error_view.dart';
import 'package:quizz/UI/widgets/question_options_dialog.dart';
import 'package:quizz/UI/widgets/quiz_timer.dart';
import 'package:quizz/core/controllers/questions_controller.dart';
import 'package:quizz/core/models/question.dart';
import 'package:quizz/utils/constants.dart';

final scoreProvider = StateProvider<int>((_) => 0);

final progressProvider = StateProvider<double>((_) => 0);

class QuestionScreen extends StatefulHookConsumerWidget {
  const QuestionScreen({
    Key? key,
    required this.category,
    this.limit = 10,
  }) : super(key: key);

  final MapEntry<String, List<dynamic>> category;
  final int limit;

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
    ref.read(questionsNotifierProvider.notifier).fetchQuestions(
          categoryTag: categoryTag,
          limit: widget.limit,
        );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final _pagesController = usePageController();
    final showTimer = ref.watch(timerOnProvider);
    return WillPopScope(
      onWillPop: () async {
        ref.read(progressProvider.notifier).state = 0;
        return true;
      },
      child: Scaffold(
        backgroundColor: scaffoldColor,
        body: ref.watch(questionsNotifierProvider).maybeMap(
          orElse: () {
            return const SizedBox();
          },
          success: (s) {
            final questions = s.data as List<Question>;
            return WillPopScope(
              onWillPop: () async {
                ref.watch(scoreProvider.notifier).state = 0;
                return true;
              },
              child: Stack(
                children: [
                  PageView.builder(
                    controller: _pagesController,
                    itemCount: questions.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, i) {
                      return QuestionPage(
                        question: questions[i],
                        questions: questions,
                        isLastPage: questions[i] == questions.last,
                        onDonePressed: () {
                          final currentProgressValue =
                              ref.read(progressProvider.notifier);

                          questions[i] == questions.last
                              ? Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (context) => ScoreScreen(
                                        totalQuestions: questions.length),
                                  ),
                                )
                              : _pagesController.nextPage(
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeInOut,
                                );
                          currentProgressValue.state +=
                              (size.width / questions.length);

                          if (questions[i] == questions.last) {
                            currentProgressValue.state = 0;
                          }
                        },
                      );
                    },
                  ),
                  if (showTimer)
                    Positioned(
                      right: 10,
                      top: size.height / 9,
                      child: QuizTimer(totalQuestions: questions.length),
                    ),
                ],
              ),
            );
          },
          loading: (_) {
            return const Center(
              child: CustomLoader(),
            );
          },
          error: (e) {
            return ErrorView(
              errorText: e.failure.reason,
              onPressed: () =>
                  ref.read(questionsNotifierProvider.notifier).fetchQuestions(
                        categoryTag: categoryTag,
                        limit: widget.limit,
                      ),
            );
          },
        ),
      ),
    );
  }
}
