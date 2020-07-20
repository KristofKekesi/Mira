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
    cam: json['camera']['name'] as String,
    camera: json['camera']['full_name'] as String,
    sol: json['sol'] as int,
    date: json['earth_date'] as String,
  );
}

Map<String, dynamic> _$EmployeesToJson(Data instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'src': instance.src,
  'cam': instance.cam,
  'camera': instance.camera,
  'date': instance.date,
  'sol': instance.sol,
};