// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Question _$$_QuestionFromJson(Map<String, dynamic> json) => _$_Question(
      category: json['category'] as String,
      id: json['id'] as String,
      correctAnswer: json['correctAnswer'] as String,
      incorrectAnswers: (json['incorrectAnswers'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      question: json['question'] as String,
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      type: json['type'] as String,
      difficulty: json['difficulty'] as String,
      regions: json['regions'] as List<dynamic>? ?? const [],
    );

Map<String, dynamic> _$$_QuestionToJson(_$_Question instance) =>
    <String, dynamic>{
      'category': instance.category,
      'id': instance.id,
      'correctAnswer': instance.correctAnswer,
      'incorrectAnswers': instance.incorrectAnswers,
      'question': instance.question,
      'tags': instance.tags,
      'type': instance.type,
      'difficulty': instance.difficulty,
      'regions': instance.regions,
    };
