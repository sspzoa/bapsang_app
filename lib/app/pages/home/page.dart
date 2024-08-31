import 'package:bapsang_app/app/core/theme/bapsang_colors.dart';
import 'package:bapsang_app/app/core/theme/bapsnag_typography.dart';
import 'package:bapsang_app/app/widgets/appbar.dart';
import 'package:bapsang_app/app/widgets/button.dart';
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
        title: Center(
          child: Text(
            "밥상",
            style: textTheme.header1.copyWith(color: colorTheme.grayscale1000),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() {
              if (controller.foodPositionList.value != null) {
                return Expanded(
                  child: ListView.builder(
                    itemCount:
                        controller.foodPositionList.value!.foodPositions.length,
                    itemBuilder: (context, index) {
                      final foodPosition = controller
                          .foodPositionList.value!.foodPositions[index];
                      return BapsangGestureDetectorWithScaleInteraction(
                        onTap: () {},
                        child: BapsangGestureDetectorWithOpacityInteraction(
                          onTap: () => controller.speakSingleFoodPosition(foodPosition),
                          child: Container(
                            decoration: BoxDecoration(
                              color: colorTheme.grayscale200,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            margin: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            child: ListTile(
                              title: Text(
                                foodPosition.food,
                                style: textTheme.itemTitle
                                    .copyWith(color: colorTheme.grayscale900),
                              ),
                              subtitle: Text(
                                foodPosition.position,
                                style: textTheme.itemDescription
                                    .copyWith(color: colorTheme.grayscale600),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              }
              return Expanded(child: Container());
            }),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
              child: controller.obx(
                (_) => BapsangButton(
                  onTap: controller.getFoodPosition,
                  child: const Text("인식하기"),
                ),
                onLoading: BapsangButton.loading(
                  backgroundColor: colorTheme.grayscale400,
                  foregroundColor: colorTheme.primaryBrand,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
