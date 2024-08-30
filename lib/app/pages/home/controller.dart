import 'package:bapsang_app/app/core/utils/errors.dart';
import 'package:bapsang_app/app/services/foodPosition/service.dart';
import 'package:bapsang_app/app/services/foodPosition/model.dart';
import 'package:bapsang_app/app/widgets/snackbar.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class HomePageController extends GetxController with StateMixin {
  final FoodPositionService foodPositionService =
  Get.find<FoodPositionService>();
  final ImagePicker imagePicker = ImagePicker();

  Rx<FoodPositionList?> get foodPositionList => foodPositionService.foodPositionList;

  @override
  void onInit() {
    super.onInit();
    change(null, status: RxStatus.success());
  }

  Future<void> getFoodPosition() async {
    try {
      change(null, status: RxStatus.loading());
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
      change(null, status: RxStatus.error(e.message));
      BapsangErrorSnackBar().open(e.message);
    } finally {
      change(null, status: RxStatus.success());
    }
  }
}