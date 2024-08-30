import 'package:json_annotation/json_annotation.dart';

part 'model.g.dart';

@JsonSerializable()
class FoodPosition {
  @JsonKey(name: 'food')
  String food;
  @JsonKey(name: 'position')
  String position;

  FoodPosition({
    required this.food,
    required this.position,
  });

  factory FoodPosition.fromJson(Map<String, dynamic> json) =>
      _$FoodPositionFromJson(json);

  Map<String, dynamic> toJson() => _$FoodPositionToJson(this);
}

@JsonSerializable()
class FoodPositionList {
  @JsonKey(name: 'food_positions', defaultValue: [])
  List<FoodPosition> foodPositions;

  FoodPositionList({
    required this.foodPositions,
  });

  factory FoodPositionList.fromJson(Map<String, dynamic> json) =>
      _$FoodPositionListFromJson(json);

  Map<String, dynamic> toJson() => _$FoodPositionListToJson(this);
}