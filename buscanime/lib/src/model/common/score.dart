library score;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:buscanime/src/model/serializers.dart';

part 'score.g.dart';

abstract class Score implements Built<Score, ScoreBuilder> {
  Score._();

  factory Score([Function(ScoreBuilder b) updates]) = _$Score;

  @BuiltValueField(wireName: 'votes')
  int get votes;

  @BuiltValueField(wireName: 'percentage')
  double get percentage;

  String toJson() {
    return json.encode(serializers.serializeWith(Score.serializer, this));
  }

  static Score fromJson(String jsonString) {
    return serializers.deserializeWith(
        Score.serializer, json.decode(jsonString));
  }

  static Serializer<Score> get serializer => _$scoreSerializer;
}
