import 'package:json_annotation/json_annotation.dart';

part 'translation_response.g.dart';

@JsonSerializable(anyMap: true)
class TranslationResponse {
  String? id;
  String? object;
  int? created;
  String? model;
  Usage? usage;
  List<Choice>? choices;

  TranslationResponse(
      {required this.id,
      required this.object,
      required this.created,
      required this.model,
      required this.usage,
      required this.choices});

  factory TranslationResponse.fromJson(Map<String, dynamic> json) =>
      _$TranslationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TranslationResponseToJson(this);
}

@JsonSerializable()
class Usage {
  @JsonKey(name: 'prompt_tokens')
  int? promptTokens;

  @JsonKey(name: 'completion_tokens')
  int? completionTokens;

  @JsonKey(name: 'total_tokens')
  int? totalTokens;

  Usage(
      {required this.promptTokens,
      required this.completionTokens,
      required this.totalTokens});

  factory Usage.fromJson(Map<String, dynamic> json) => _$UsageFromJson(json);

  Map<String, dynamic> toJson() => _$UsageToJson(this);
}

@JsonSerializable()
class Choice {
  Message? message;

  @JsonKey(name: 'finish_reason')
  dynamic finishReason;

  int? index;

  Choice({required this.message, this.finishReason, required this.index});

  factory Choice.fromJson(Map<String, dynamic> json) => _$ChoiceFromJson(json);

  Map<String, dynamic> toJson() => _$ChoiceToJson(this);
}

@JsonSerializable()
class Message {
  String? role;
  String? content;

  Message({required this.role, required this.content});

  factory Message.fromJson(Map<String, dynamic> json) => _$MessageFromJson(json);

  Map<String, dynamic> toJson() => _$MessageToJson(this);
}
