// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$EmployeesFromJson(Map<String, dynamic> json) {
  return Data(
    id: json['id'] as int,
    name: json['rover']['name'] as String,
    src: json['img_src'] as String,
  );
}

Map<String, dynamic> _$EmployeesToJson(Data instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'src': instance.src,
};