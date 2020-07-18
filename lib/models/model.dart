import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

part 'model.g.dart';

@JsonSerializable()
class Data {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'name')
  final String name;
@JsonKey(name: 'src')
  final String src;

  Data({this.id, this.name, this.src});

  factory Data.fromJson(Map<String, dynamic> json) => _$EmployeesFromJson(json);
  Map<String, dynamic> toJson() => _$EmployeesToJson(this);
}