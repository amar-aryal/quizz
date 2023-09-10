import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quizz/app_setup/app_models/failure.dart';
import 'package:quizz/app_setup/network/dio_helper.dart';
import 'package:quizz/utils/endpoints.dart';

final categoryRepository = Provider<CategoryRepository>((ref) {
  return CategoryRepository(ref);
});

class CategoryRepository {
  CategoryRepository(Ref ref) : _ref = ref;
  final Ref _ref;

  Dio get _dio => _ref.read(dioProvider);

  Future<Either<Map<String, List<dynamic>>, Failure>> getAllCategories({
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _dio.get(
        categoriesUrl,
        cancelToken: cancelToken,
      );
      log('$response');
      final categoriesObj = Map<String, List<dynamic>>.from(response.data);
      return Left(categoriesObj);
    } on DioException catch (e) {
      return Right(e.toFailure);
    } catch (e) {
      return Right(Failure.fromException(e));
    }
  }
}
