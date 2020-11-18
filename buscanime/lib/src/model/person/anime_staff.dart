library anime_staff;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:buscanime/src/model/common/generic_info.dart';
import 'package:buscanime/src/model/serializers.dart';

part 'anime_staff.g.dart';

abstract class AnimeStaff implements Built<AnimeStaff, AnimeStaffBuilder> {
  AnimeStaff._();

  factory AnimeStaff([Function(AnimeStaffBuilder b) updates]) = _$AnimeStaff;

  @BuiltValueField(wireName: 'position')
  String get position;

  @BuiltValueField(wireName: 'anime')
  GenericInfo get anime;

  String toJson() {
    return json.encode(serializers.serializeWith(AnimeStaff.serializer, this));
  }

  static AnimeStaff fromJson(String jsonString) {
    return serializers.deserializeWith(
        AnimeStaff.serializer, json.decode(jsonString));
  }

  static Serializer<AnimeStaff> get serializer => _$animeStaffSerializer;
}
