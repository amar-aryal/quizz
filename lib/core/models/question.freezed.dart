// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'question.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Question _$QuestionFromJson(Map<String, dynamic> json) {
  return _Question.fromJson(json);
}

/// @nodoc
mixin _$Question {
  String get category => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  String get correctAnswer => throw _privateConstructorUsedError;
  List<String> get incorrectAnswers => throw _privateConstructorUsedError;
  String get question => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get difficulty => throw _privateConstructorUsedError;
  List<dynamic> get regions => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuestionCopyWith<Question> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionCopyWith<$Res> {
  factory $QuestionCopyWith(Question value, $Res Function(Question) then) =
      _$QuestionCopyWithImpl<$Res, Question>;
  @useResult
  $Res call(
      {String category,
      String id,
      String correctAnswer,
      List<String> incorrectAnswers,
      String question,
      List<String> tags,
      String type,
      String difficulty,
      List<dynamic> regions});
}

/// @nodoc
class _$QuestionCopyWithImpl<$Res, $Val extends Question>
    implements $QuestionCopyWith<$Res> {
  _$QuestionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? id = null,
    Object? correctAnswer = null,
    Object? incorrectAnswers = null,
    Object? question = null,
    Object? tags = null,
    Object? type = null,
    Object? difficulty = null,
    Object? regions = null,
  }) {
    return _then(_value.copyWith(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      correctAnswer: null == correctAnswer
          ? _value.correctAnswer
          : correctAnswer // ignore: cast_nullable_to_non_nullable
              as String,
      incorrectAnswers: null == incorrectAnswers
          ? _value.incorrectAnswers
          : incorrectAnswers // ignore: cast_nullable_to_non_nullable
              as List<String>,
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      difficulty: null == difficulty
          ? _value.difficulty
          : difficulty // ignore: cast_nullable_to_non_nullable
              as String,
      regions: null == regions
          ? _value.regions
          : regions // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_QuestionCopyWith<$Res> implements $QuestionCopyWith<$Res> {
  factory _$$_QuestionCopyWith(
          _$_Question value, $Res Function(_$_Question) then) =
      __$$_QuestionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String category,
      String id,
      String correctAnswer,
      List<String> incorrectAnswers,
      String question,
      List<String> tags,
      String type,
      String difficulty,
      List<dynamic> regions});
}

/// @nodoc
class __$$_QuestionCopyWithImpl<$Res>
    extends _$QuestionCopyWithImpl<$Res, _$_Question>
    implements _$$_QuestionCopyWith<$Res> {
  __$$_QuestionCopyWithImpl(
      _$_Question _value, $Res Function(_$_Question) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? id = null,
    Object? correctAnswer = null,
    Object? incorrectAnswers = null,
    Object? question = null,
    Object? tags = null,
    Object? type = null,
    Object? difficulty = null,
    Object? regions = null,
  }) {
    return _then(_$_Question(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      correctAnswer: null == correctAnswer
          ? _value.correctAnswer
          : correctAnswer // ignore: cast_nullable_to_non_nullable
              as String,
      incorrectAnswers: null == incorrectAnswers
          ? _value._incorrectAnswers
          : incorrectAnswers // ignore: cast_nullable_to_non_nullable
              as List<String>,
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      difficulty: null == difficulty
          ? _value.difficulty
          : difficulty // ignore: cast_nullable_to_non_nullable
              as String,
      regions: null == regions
          ? _value._regions
          : regions // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Question implements _Question {
  const _$_Question(
      {required this.category,
      required this.id,
      required this.correctAnswer,
      final List<String> incorrectAnswers = const [],
      required this.question,
      final List<String> tags = const [],
      required this.type,
      required this.difficulty,
      final List<dynamic> regions = const []})
      : _incorrectAnswers = incorrectAnswers,
        _tags = tags,
        _regions = regions;

  factory _$_Question.fromJson(Map<String, dynamic> json) =>
      _$$_QuestionFromJson(json);

  @override
  final String category;
  @override
  final String id;
  @override
  final String correctAnswer;
  final List<String> _incorrectAnswers;
  @override
  @JsonKey()
  List<String> get incorrectAnswers {
    if (_incorrectAnswers is EqualUnmodifiableListView)
      return _incorrectAnswers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_incorrectAnswers);
  }

  @override
  final String question;
  final List<String> _tags;
  @override
  @JsonKey()
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  final String type;
  @override
  final String difficulty;
  final List<dynamic> _regions;
  @override
  @JsonKey()
  List<dynamic> get regions {
    if (_regions is EqualUnmodifiableListView) return _regions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_regions);
  }

  @override
  String toString() {
    return 'Question(category: $category, id: $id, correctAnswer: $correctAnswer, incorrectAnswers: $incorrectAnswers, question: $question, tags: $tags, type: $type, difficulty: $difficulty, regions: $regions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Question &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.correctAnswer, correctAnswer) ||
                other.correctAnswer == correctAnswer) &&
            const DeepCollectionEquality()
                .equals(other._incorrectAnswers, _incorrectAnswers) &&
            (identical(other.question, question) ||
                other.question == question) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.difficulty, difficulty) ||
                other.difficulty == difficulty) &&
            const DeepCollectionEquality().equals(other._regions, _regions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      category,
      id,
      correctAnswer,
      const DeepCollectionEquality().hash(_incorrectAnswers),
      question,
      const DeepCollectionEquality().hash(_tags),
      type,
      difficulty,
      const DeepCollectionEquality().hash(_regions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_QuestionCopyWith<_$_Question> get copyWith =>
      __$$_QuestionCopyWithImpl<_$_Question>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_QuestionToJson(
      this,
    );
  }
}

abstract class _Question implements Question {
  const factory _Question(
      {required final String category,
      required final String id,
      required final String correctAnswer,
      final List<String> incorrectAnswers,
      required final String question,
      final List<String> tags,
      required final String type,
      required final String difficulty,
      final List<dynamic> regions}) = _$_Question;

  factory _Question.fromJson(Map<String, dynamic> json) = _$_Question.fromJson;

  @override
  String get category;
  @override
  String get id;
  @override
  String get correctAnswer;
  @override
  List<String> get incorrectAnswers;
  @override
  String get question;
  @override
  List<String> get tags;
  @override
  String get type;
  @override
  String get difficulty;
  @override
  List<dynamic> get regions;
  @override
  @JsonKey(ignore: true)
  _$$_QuestionCopyWith<_$_Question> get copyWith =>
      throw _privateConstructorUsedError;
}
