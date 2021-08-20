// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataModel _$DataModelFromJson(Map<String, dynamic> json) {
  return DataModel(
    inventoryId: json['inventoryId'] as int?,
    name: json['name'] as String?,
    type: json['type'] as String?,
    tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
    purchasedAt: json['purchasedAt'] as int?,
    placement: json['placement'] == null
        ? null
        : Placement.fromJson(json['placement'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DataModelToJson(DataModel instance) => <String, dynamic>{
      'inventoryId': instance.inventoryId,
      'name': instance.name,
      'type': instance.type,
      'tags': instance.tags,
      'purchasedAt': instance.purchasedAt,
      'placement': instance.placement,
    };
