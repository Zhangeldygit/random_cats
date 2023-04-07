import 'package:json_annotation/json_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'cat_model.g.dart';

@JsonSerializable()
@HiveType(typeId: 0)
class CatModel {
  @HiveField(0)
  String? fact;
  @HiveField(1)
  int? length;

  CatModel({this.fact, this.length});

  factory CatModel.fromJson(Map<String, dynamic> json) =>
      _$CatModelFromJson(json);
  Map<String, dynamic> toJson() => _$CatModelToJson(this);
}
