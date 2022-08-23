import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quizz/app_setup/app_models/base_state.dart';
import 'package:quizz/core/repositories/category_repository.dart';

final categoryNotifierProvider =
    StateNotifierProvider.autoDispose<CategoryController, BaseState>(
        categoryController);

CategoryController<T> categoryController<T>(Ref ref) {
  final cancelToken = CancelToken();
  ref.onDispose(cancelToken.cancel);
  return CategoryController<T>(ref.read, cancelToken);
}

class CategoryController<T> extends StateNotifier<BaseState> {
  CategoryController(this._read, this._cancelToken)
      : super(const BaseState.initial());

  final Reader _read;

  final CancelToken _cancelToken;

  CategoryRepository get _repo => _read(categoryRepository);

  Future<void> getAllCategories() async {
    state = const BaseState.loading();
    final response = await _repo.getAllCategories(cancelToken: _cancelToken);

    state = response.fold(
      (categories) => BaseState.success(data: categories),
      (error) => BaseState.error(error),
    );
  }
}
