class ExerciseModel {
  ExerciseModel({
    required this.success,
    required this.data,
    required this.message,
  });
  late final bool? success;
  late final Data? data;
  late final String? message;

  ExerciseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = Data.fromJson(json['data']);
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['data'] = data?.toJson();
    _data['message'] = message;
    return _data;
  }
}

class Data {
  Data({
    required this.test,
    required this.exercises,
  });
  Test? test;
  late final List<Exercises> exercises;

  Data.fromJson(Map<String, dynamic> json) {
    test = Test.fromJson(json['test']);
    exercises =
        List.from(json['exercises']).map((e) => Exercises.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['test'] = test?.toJson();
    _data['exercises'] = exercises.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Test {
  Test({
    required this.id,
    required this.name,
    required this.duration,
  });
  late final int? id;
  late final String? name;
  late final String? duration;

  Test.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    duration = json['duration'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['duration'] = duration;
    return _data;
  }
}

class Exercises {
  Exercises({
    required this.id,
    required this.institutionId,
    required this.type,
    required this.testId,
    required this.question,
    this.image,
    required this.audio,
    this.answerKey,
    required this.defaultAccess,
    required this.createdAt,
    required this.updatedAt,
    required this.status,
    required this.userExercisesCount,
    required this.subQuestions,
  });
  late final int id;
  late final String? institutionId;
  late final String? type;
  late final String testId;
  String? question;
  late final String? image;
  String? audio;
  late final String? answerKey;
  late final String? defaultAccess;
  late final String? createdAt;
  late final String? updatedAt;
  late final String? status;
  late final String? userExercisesCount;
  late final List<SubQuestions>? subQuestions;

  Exercises.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    institutionId = json['institution_id'];
    type = json['type'];
    testId = json['test_id'];
    question = json['question'];
    image = json['image'];
    audio = json['audio'];
    answerKey = json['answerKey'];
    defaultAccess = json['default_access'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    status = json['status'];
    userExercisesCount = json['user_exercises_count'];
    subQuestions = List.from(json['sub_questions'])
        .map((e) => SubQuestions.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['institution_id'] = institutionId;
    _data['type'] = type;
    _data['test_id'] = testId;
    _data['question'] = question;
    _data['image'] = image;
    _data['audio'] = audio;
    _data['answer_key'] = answerKey;
    _data['default_access'] = defaultAccess;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['status'] = status;
    _data['user_exercises_count'] = userExercisesCount;
    _data['sub_questions'] = subQuestions?.map((e) => e.toJson()).toList();
    return _data;
  }
}

class SubQuestions {
  SubQuestions({
    required this.id,
    required this.exerciseId,
    required this.question,
    this.image,
    this.audio,
    required this.typeId,
    required this.noOfOptions,
    this.answer,
    this.audioAnswer,
    this.explanation,
    required this.type,
    required this.options,
  });
  late final int id;
  late final String? exerciseId;
  late final String? question;
  late final String? image;
  late final String? audio;
  late final String? typeId;
  late final String? noOfOptions;
  String? answer;
  late final String? audioAnswer;
  late final String? explanation;
  late final Type? type;
  late final List<Options> options;

  SubQuestions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    exerciseId = json['exercise_id'];
    question = json['question'];
    image = json['image'];
    audio = json['audio'];
    typeId = json['type_id'];
    noOfOptions = json['no_of_options'];
    answer = json['answer'];
    audioAnswer = json['audioAnswer'];
    explanation = json['explanation'];
    type = Type.fromJson(json['type']);
    options =
        List.from(json['options']).map((e) => Options.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['exercise_id'] = exerciseId;
    _data['question'] = question;
    _data['image'] = image;
    _data['audio'] = audio;
    _data['type_id'] = typeId;
    _data['no_of_options'] = noOfOptions;
    _data['answer'] = answer;
    _data['audio_answer'] = audioAnswer;
    _data['explanation'] = explanation;
    _data['type'] = type?.toJson();
    _data['options'] = options.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Type {
  Type({
    required this.id,
    required this.name,
  });
  int? id;
  String? name;

  Type.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    return _data;
  }
}

class Options {
  Options({
    required this.questionId,
    required this.option,
    this.audio,
  });
  late final String? questionId;
  late final String? option;
  String? audio;

  Options.fromJson(Map<String, dynamic> json) {
    questionId = json['question_id'];
    option = json['option'];
    audio = json['audio'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['question_id'] = questionId;
    _data['option'] = option;
    _data['audio'] = audio;
    return _data;
  }
}
