library producer;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:buscanime/src/model/common/meta.dart';
import 'package:buscanime/src/model/anime/anime_item.dart';
import 'package:buscanime/src/model/serializers.dart';

part 'producer.g.dart';

abstract class Producer implements Built<Producer, ProducerBuilder> {
  Producer._();

  factory Producer([Function(ProducerBuilder b) updates]) = _$Producer;

  @BuiltValueField(wireName: 'meta')
  Meta get meta;

  @BuiltValueField(wireName: 'anime')
  BuiltList<AnimeItem> get anime;

  String toJson() {
    return json.encode(serializers.serializeWith(Producer.serializer, this));
  }

  static Producer fromJson(String jsonString) {
    return serializers.deserializeWith(
        Producer.serializer, json.decode(jsonString));
  }

  static Serializer<Producer> get serializer => _$producerSerializer;
}
