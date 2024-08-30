import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'model.dart';
import 'repository.dart';

class FoodPositionService extends GetxController {
  final WelcomeRepository repository;
  final Rx<FoodPositionList?> foodPositionList = Rx<FoodPositionList?>(null);

  FoodPositionService({WelcomeRepository? repository})
      : repository = repository ?? WelcomeRepository();

  Future<void> getFoodPosition({required XFile image}) async {
    try {
      FoodPositionList result = await repository.getFoodPosition(file: image);
      foodPositionList.value = result;
    } catch (e) {
      foodPositionList.value = null;
    }
  }
}