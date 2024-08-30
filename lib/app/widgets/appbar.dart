import 'package:bapsang_app/app/core/theme/bapsang_colors.dart';
import 'package:bapsang_app/app/core/theme/bapsnag_typography.dart';
import 'package:bapsang_app/app/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BapsangAppbar extends StatelessWidget {
  final String? header;
  final String? paragraph;
  final Widget? leading;
  final void Function()? onBackButtonPressed;

  const BapsangAppbar(
      {super.key,
      this.header,
      this.paragraph,
      this.leading,
      this.onBackButtonPressed});

  @override
  Widget build(BuildContext context) {
    BapsangColors colorTheme = Theme.of(context).extension<BapsangColors>()!;
    BapsangTypography textTheme = Theme.of(context).extension<BapsangTypography>()!;
    return SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                leading != null
                    ? leading!
                    : BapsangGestureDetectorWithOpacityInteraction(
                        onTap: () {
                          if (onBackButtonPressed != null) {
                            onBackButtonPressed!.call();
                          } else {
                            Get.back();
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          color: colorTheme.grayscale100,
                          child: Icon(Icons.arrow_back_ios_rounded,
                              size: 20, color: colorTheme.grayscale500),
                        ),
                      ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      if (header != null)
                        Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: Text(
                            header!,
                            style: textTheme.header1
                                .copyWith(color: colorTheme.grayscale1000),
                          ),
                        ),
                      if (paragraph != null)
                        Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: Text(
                            paragraph!,
                            style: textTheme.paragraph1
                                .copyWith(color: colorTheme.grayscale700),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
