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
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const BapsangAppbar(header: '밥상'),
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
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10),
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
