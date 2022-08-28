import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quizz/app_setup/app_models/failure.dart';
import 'package:quizz/app_setup/network/dio_helper.dart';
import 'package:quizz/core/models/question.dart';
import 'package:quizz/utils/endpoints.dart';

final questionsRepository = Provider<QuestionsRepository>((ref) {
  return QuestionsRepository(ref.read);
});

class QuestionsRepository {
  QuestionsRepository(Reader read) : _read = read;
  final Reader _read;

  Dio get _dio => _read(dioProvider);

  Future<Either<List<Question>, Failure>> fetchQuestions({
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _dio.get(
        questionsUrl,
        cancelToken: cancelToken,
      );
      log('$response');
      final qsList = List<Map<String, dynamic>>.from(response.data);
      final questionObjList = qsList.map((e) => Question.fromJson(e)).toList();
      return Left(questionObjList);
    } on DioError catch (e) {
      return Right(e.toFailure);
    } catch (e) {
      return Right(Failure.fromException(e));
    }
  }
}
