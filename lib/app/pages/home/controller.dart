import 'package:bapsang_app/app/core/utils/errors.dart';
import 'package:bapsang_app/app/services/foodPosition/service.dart';
import 'package:bapsang_app/app/services/foodPosition/model.dart';
import 'package:bapsang_app/app/widgets/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_tts/flutter_tts.dart';

class HomePageController extends GetxController with StateMixin {
  final FoodPositionService foodPositionService = Get.find<FoodPositionService>();
  final ImagePicker imagePicker = ImagePicker();
  final FlutterTts flutterTts = FlutterTts();

  Rx<FoodPositionList?> get foodPositionList => foodPositionService.foodPositionList;

  @override
  void onInit() {
    super.onInit();
    change(null, status: RxStatus.success());
    _initTts();
  }

  Future<void> _initTts() async {
    await flutterTts.setLanguage("ko-KR");
    await flutterTts.setSpeechRate(1);
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
        await flutterTts.speak('인식 중입니다. 잠시만 기다려주세요.');
        await foodPositionService.getFoodPosition(image: imageData);
        await _speakFoodPositions();
      }
    } on BapsangException catch (e) {
      print('Error: ${e.message}');
      change(null, status: RxStatus.error(e.message));
      BapsangErrorSnackBar().open(e.message);
    } finally {
      change(null, status: RxStatus.success());
    }
  }

  String _getProperParticle(String noun) {
    final lastChar = noun.characters.last;
    final lastCharCode = lastChar.codeUnitAt(0);

    if (lastCharCode < 0xAC00 || lastCharCode > 0xD7A3) {
      return "은";
    }

    final jong = (lastCharCode - 0xAC00) % 28;
    return jong == 0 ? "는" : "은";
  }

  Future<void> _speakFoodPositions() async {
    if (foodPositionList.value != null) {
      String textToSpeak = "음식 위치 정보입니다. ";
      for (var foodPosition in foodPositionList.value!.foodPositions) {
        textToSpeak += _getFoodPositionText(foodPosition);
      }
      textToSpeak += "이상입니다. ";
      await flutterTts.speak(textToSpeak);
    }
  }

  Future<void> speakSingleFoodPosition(FoodPosition foodPosition) async {
    String textToSpeak = _getFoodPositionText(foodPosition);
    await flutterTts.speak(textToSpeak);
  }

  String _getFoodPositionText(FoodPosition foodPosition) {
    final particle = _getProperParticle(foodPosition.food);
    return "${foodPosition.food}$particle ${foodPosition.position} 방향에 있습니다. ";
  }
}