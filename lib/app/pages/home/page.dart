import 'package:bapsang_app/app/core/theme/bapsang_colors.dart';
import 'package:bapsang_app/app/core/theme/bapsnag_typography.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

class HomePage extends GetView<HomePageController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).extension<BapsangColors>()!;
    final textTheme = Theme.of(context).extension<BapsangTypography>()!;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => ElevatedButton(
                  onPressed: controller.isLoading.value
                      ? null
                      : controller.getFoodPosition,
                  child: controller.isLoading.value
                      ? SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Theme.of(context).colorScheme.onPrimary,
                            ),
                          ),
                        )
                      : const Text('인식하기'),
                )),
            const SizedBox(height: 20),
            Obx(() {
              if (controller.foodPositionList.value != null) {
                return Expanded(
                  child: ListView.builder(
                    itemCount:
                        controller.foodPositionList.value!.foodPositions.length,
                    itemBuilder: (context, index) {
                      final foodPosition = controller
                          .foodPositionList.value!.foodPositions[index];
                      return ListTile(
                        title: Text(foodPosition.food),
                        subtitle: Text(foodPosition.position),
                      );
                    },
                  ),
                );
              }
              return Expanded(child: Container());
            }),
          ],
        ),
      ),
    );
  }
}
