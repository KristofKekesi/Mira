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
@JsonKey(name: 'cam')
  final String cam;
@JsonKey(name: 'camera')
  final String camera;
@JsonKey(name: 'date')
  final String date;
@JsonKey(name: 'sol')
  final int sol;

  Data({this.id, this.name, this.src, this.cam, this.camera, this.date, this.sol});

  factory Data.fromJson(Map<String, dynamic> json) => _$EmployeesFromJson(json);
  Map<String, dynamic> toJson() => _$EmployeesToJson(this);
}