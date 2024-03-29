import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quizz/app_setup/app_models/failure.dart';
import 'package:quizz/app_setup/network/dio_helper.dart';
import 'package:quizz/core/models/question.dart';
import 'package:quizz/utils/endpoints.dart';

final questionsRepository = Provider<QuestionsRepository>((ref) {
  return QuestionsRepository(ref);
});

class QuestionsRepository {
  QuestionsRepository(Ref ref) : _ref = ref;
  final Ref _ref;

  Dio get _dio => _ref.read(dioProvider);

  Future<Either<List<Question>, Failure>> fetchQuestions({
    CancelToken? cancelToken,
    required String categoryTag,
    required int limit,
  }) async {
    try {
      final response = await _dio.get(
        questionsUrl,
        queryParameters: {
          'categories': categoryTag,
          'limit': limit,
        },
        cancelToken: cancelToken,
      );
      log('$response');
      final qsList = List<Map<String, dynamic>>.from(response.data);
      final questionObjList = qsList.map((e) => Question.fromJson(e)).toList();
      return Left(questionObjList);
    } on DioException catch (e) {
      return Right(e.toFailure);
    } catch (e) {
      return Right(Failure.fromException(e));
    }
  }
}
