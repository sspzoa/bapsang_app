import 'package:bapsang_app/app/core/utils/errors.dart';
import 'package:bapsang_app/app/services/foodPosition/service.dart';
import 'package:bapsang_app/app/services/foodPosition/model.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class HomePageController extends GetxController {
  final FoodPositionService foodPositionService =
  Get.find<FoodPositionService>();
  final ImagePicker imagePicker = ImagePicker();

  final RxBool isLoading = false.obs;

  Rx<FoodPositionList?> get foodPositionList => foodPositionService.foodPositionList;

  Future<void> getFoodPosition() async {
    if (isLoading.value) return;

    try {
      isLoading.value = true;
      XFile? imageData = await imagePicker.pickImage(
          source: ImageSource.camera,
          preferredCameraDevice: CameraDevice.rear,
          maxHeight: 2048,
          maxWidth: 1024);
      if (imageData != null) {
        await foodPositionService.getFoodPosition(image: imageData);
      }
    } on BapsangException catch (e) {
      print('Error: ${e.message}');
    } finally {
      isLoading.value = false;
    }
  }
}