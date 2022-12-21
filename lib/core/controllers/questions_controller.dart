import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quizz/app_setup/app_models/base_state.dart';
import 'package:quizz/core/repositories/questions_repository.dart';

final questionsNotifierProvider =
    StateNotifierProvider.autoDispose<QuestionsController, BaseState>(
        questionsController);

QuestionsController<T> questionsController<T>(Ref ref) {
  final cancelToken = CancelToken();
  ref.onDispose(cancelToken.cancel);
  return QuestionsController<T>(ref.read, cancelToken);
}

class QuestionsController<T> extends StateNotifier<BaseState> {
  QuestionsController(this._read, this._cancelToken)
      : super(const BaseState.initial());

  final Reader _read;

  final CancelToken _cancelToken;

  QuestionsRepository get _repo => _read(questionsRepository);

  Future<void> fetchQuestions({
    required String categoryTag,
    required int limit,
  }) async {
    state = const BaseState.loading();
    final response = await _repo.fetchQuestions(
      categoryTag: categoryTag,
      cancelToken: _cancelToken,
      limit: limit,
    );

    state = response.fold(
      (questions) => BaseState.success(data: questions),
      (error) => BaseState.error(error),
    );
  }
}
