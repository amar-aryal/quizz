import 'package:freezed_annotation/freezed_annotation.dart';

part 'question.freezed.dart';
part 'question.g.dart';

@freezed
class Question with _$Question {
  const factory Question({
    required String category,
    required String id,
    required String correctAnswer,
    @Default([]) List<String> incorrectAnswers,
    required String question,
    @Default([]) List<String> tags,
    required String type,
    required String difficulty,
    @Default([]) List<dynamic> regions,
  }) = _Question;

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);
}
