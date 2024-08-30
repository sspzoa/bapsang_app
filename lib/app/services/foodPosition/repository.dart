import 'package:bapsang_app/app/core/utils/errors.dart';
import 'package:bapsang_app/app/provider/api_interface.dart';
import 'package:bapsang_app/app/provider/model/response.dart';
import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';

// ignore: depend_on_referenced_packages
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';

import 'model.dart';

class WelcomeRepository {
  final ApiProvider api;

  WelcomeRepository({ApiProvider? api}) : api = Get.find<ApiProvider>();

  Future<FoodPositionList> getFoodPosition({required XFile file}) async {
    String url = '/analyze-food-positions';

    MultipartFile image = await MultipartFile.fromFile(file.path,
        contentType: MediaType('image', 'jpeg'));

    try {
      BapsangHttpResponse response = await api.post(url,
          data: FormData.fromMap({
            'image': image,
          }));

      return FoodPositionList.fromJson(response.data);
    } on DioException catch (e) {
      throw BapsangException(e.response?.data['detail']);
    }
  }
}