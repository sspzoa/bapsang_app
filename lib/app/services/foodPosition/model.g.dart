// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FoodPosition _$FoodPositionFromJson(Map<String, dynamic> json) => FoodPosition(
      food: json['food'] as String,
      position: json['position'] as String,
    );

Map<String, dynamic> _$FoodPositionToJson(FoodPosition instance) =>
    <String, dynamic>{
      'food': instance.food,
      'position': instance.position,
    };

FoodPositionList _$FoodPositionListFromJson(Map<String, dynamic> json) =>
    FoodPositionList(
      foodPositions: (json['food_positions'] as List<dynamic>?)
              ?.map((e) => FoodPosition.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$FoodPositionListToJson(FoodPositionList instance) =>
    <String, dynamic>{
      'food_positions': instance.foodPositions,
    };
