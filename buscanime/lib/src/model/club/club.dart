library club;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:buscanime/jikan_api.dart';
import 'package:buscanime/src/model/serializers.dart';

part 'club.g.dart';

abstract class Club implements Built<Club, ClubBuilder> {
  Club._();

  factory Club([Function(ClubBuilder b) updates]) = _$Club;

  @BuiltValueField(wireName: 'mal_id')
  int get malId;

  @BuiltValueField(wireName: 'url')
  String get url;

  @BuiltValueField(wireName: 'image_url')
  String get imageUrl;

  @BuiltValueField(wireName: 'title')
  String get title;

  @BuiltValueField(wireName: 'members_count')
  int get membersCount;

  @BuiltValueField(wireName: 'pictures_count')
  int get picturesCount;

  @BuiltValueField(wireName: 'category')
  String get category;

  @BuiltValueField(wireName: 'created')
  String get created;

  @BuiltValueField(wireName: 'type')
  String get type;

  @BuiltValueField(wireName: 'staff')
  BuiltList<Meta> get staff;

  @BuiltValueField(wireName: 'anime_relations')
  BuiltList<Meta> get animeRelations;

  @BuiltValueField(wireName: 'manga_relations')
  BuiltList<Meta> get mangaRelations;

  @BuiltValueField(wireName: 'character_relations')
  BuiltList<Meta> get characterRelations;

  String toJson() {
    return json.encode(serializers.serializeWith(Club.serializer, this));
  }

  static Club fromJson(String jsonString) {
    return serializers.deserializeWith(
        Club.serializer, json.decode(jsonString));
  }

  static Serializer<Club> get serializer => _$clubSerializer;
}
