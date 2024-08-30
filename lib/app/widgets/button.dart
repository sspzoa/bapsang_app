import 'package:bapsang_app/app/core/theme/bapsang_colors.dart';
import 'package:bapsang_app/app/core/theme/bapsnag_typography.dart';
import 'package:bapsang_app/app/core/theme/light.dart';

import 'package:flutter/material.dart';

class BapsangGestureDetectorWithFillInteraction extends StatefulWidget {
  final void Function()? onTap;
  final void Function()? onLongPress;
  final Duration duration;
  final Widget child;
  final EdgeInsets effectPadding;
  final double effectBorderRadius;
  const BapsangGestureDetectorWithFillInteraction({
    super.key,
    this.onTap,
    this.onLongPress,
    required this.child,
    this.duration = const Duration(milliseconds: 100),
    this.effectPadding = EdgeInsets.zero,
    this.effectBorderRadius = 0,
  });

  @override
  State<BapsangGestureDetectorWithFillInteraction> createState() => _BapsangGestureDetectorWithFillInteractionState();
}

class _BapsangGestureDetectorWithFillInteractionState extends State<BapsangGestureDetectorWithFillInteraction> {
  bool isPressed = false;

  void pressUp() {
    if (widget.onTap == null && widget.onLongPress == null) {
      return;
    }
    setState(() {
      isPressed = false;
    });
  }

  void pressDown() {
    if (widget.onTap == null && widget.onLongPress == null) {
      return;
    }
    setState(() {
      isPressed = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    BapsangColors colorTheme = Theme.of(context).extension<BapsangColors>()!;
    return GestureDetector(
      onTap: widget.onTap,
      onLongPress: widget.onLongPress,
      onTapCancel: pressUp,
      child: Listener(
        onPointerDown: (_) => pressDown(),
        onPointerUp: (_) => pressUp(),
        child: Container(
          color: Colors.transparent,
          child: Stack(
            children: [
              Positioned.fill(
                child: AnimatedOpacity(
                  opacity: isPressed ? 0.05 : 0,
                  duration: widget.duration,
                  child: Container(
                    margin: widget.effectPadding,
                    decoration: BoxDecoration(
                      color: colorTheme.grayscale1000,
                      borderRadius: BorderRadius.circular(widget.effectBorderRadius),
                    ),
                  ),
                ),
              ),
              widget.child,
            ],
          ),
        ),
      ),
    );
  }
}

class BapsangGestureDetectorWithOpacityInteraction extends StatefulWidget {
  final void Function()? onTap;
  final void Function()? onLongPress;
  final Duration duration;
  final Widget child;
  const BapsangGestureDetectorWithOpacityInteraction({
    super.key,
    this.onTap,
    this.onLongPress,
    required this.child,
    this.duration = const Duration(milliseconds: 100),
  });

  @override
  State<BapsangGestureDetectorWithOpacityInteraction> createState() => _BapsangGestureDetectorWithOpacityInteractionState();
}

class _BapsangGestureDetectorWithOpacityInteractionState extends State<BapsangGestureDetectorWithOpacityInteraction> {
  bool isPressed = false;

  void pressUp() {
    if (widget.onTap == null && widget.onLongPress == null) {
      return;
    }
    setState(() {
      isPressed = false;
    });
  }

  void pressDown() {
    if (widget.onTap == null && widget.onLongPress == null) {
      return;
    }
    setState(() {
      isPressed = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      onLongPress: widget.onLongPress,
      onTapCancel: pressUp,
      child: Listener(
        onPointerDown: (_) => pressDown(),
        onPointerUp: (_) => pressUp(),
        child: Container(
          color: Colors.transparent,
          child: AnimatedOpacity(
            duration: widget.duration,
            curve: Curves.easeOut,
            opacity: isPressed ? 0.6 : 1,
            child: widget.child,
          ),
        ),
      ),
    );
  }
}

class BapsangGestureDetectorWithScaleInteraction extends StatefulWidget {
  final void Function()? onTap;
  final void Function()? onLongPress;
  final Duration duration;
  final Widget child;
  const BapsangGestureDetectorWithScaleInteraction({
    super.key,
    this.onTap,
    this.onLongPress,
    required this.child,
    this.duration = const Duration(milliseconds: 100),
  });

  @override
  State<BapsangGestureDetectorWithScaleInteraction> createState() => _BapsangGestureDetectorWithScaleInteractionState();
}

class _BapsangGestureDetectorWithScaleInteractionState extends State<BapsangGestureDetectorWithScaleInteraction> {
  bool isPressed = false;

  void pressUp() {
    if (widget.onTap == null && widget.onLongPress == null) {
      return;
    }
    setState(() {
      isPressed = false;
    });
  }

  void pressDown() {
    if (widget.onTap == null && widget.onLongPress == null) {
      return;
    }
    setState(() {
      isPressed = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: isPressed ? 0.97 : 1,
      duration: widget.duration,
      curve: Curves.easeOut,
      child: GestureDetector(
        onTap: widget.onTap,
        onLongPress: widget.onLongPress,
        onTapCancel: pressUp,
        child: Listener(
          onPointerDown: (_) => pressDown(),
          onPointerUp: (_) => pressUp(),
          child: widget.child,
        ),
      ),
    );
  }
}

class BapsangButton extends StatefulWidget {
  final void Function()? onTap;
  final void Function()? onLongPress;
  final Widget child;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final BoxBorder? border;

  const BapsangButton({
    super.key,
    this.onTap,
    this.onLongPress,
    this.backgroundColor,
    this.border,
    this.foregroundColor,
    required this.child,
  });

  BapsangButton.loading({
    super.key,
    this.backgroundColor,
    this.border,
    this.foregroundColor,
  })  : onTap = null,
        onLongPress = null,
        child = SizedBox(
          width: 20,
          height: 20,
          child: CircularProgressIndicator(color: foregroundColor ?? Colors.white, strokeWidth: 2),
        );

  BapsangButton.disabled({
    super.key,
    Color? backgroundColor,
    Color? foregroundColor,
    this.border,
    required this.child,
  })  : onTap = null,
        onLongPress = null,
        backgroundColor = backgroundColor ?? BapsangLightThemeColors().primaryBrand.withAlpha(100),
        foregroundColor = foregroundColor ?? Colors.white.withAlpha(120);

  @override
  State<BapsangButton> createState() => _BapsangButtonState();
}

class _BapsangButtonState extends State<BapsangButton> {
  @override
  Widget build(BuildContext context) {
    BapsangColors colorTheme = Theme.of(context).extension<BapsangColors>()!;
    BapsangTypography textTheme = Theme.of(context).extension<BapsangTypography>()!;
    return BapsangGestureDetectorWithScaleInteraction(
      onTap: widget.onTap,
      onLongPress: widget.onLongPress,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        child: BapsangGestureDetectorWithOpacityInteraction(
          onTap: widget.onTap,
          onLongPress: widget.onLongPress,
          child: Container(
            decoration: BoxDecoration(
              color: widget.backgroundColor ?? colorTheme.primaryBrand,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              border: widget.border,
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: DefaultTextStyle.merge(
                  style: textTheme.itemDescription.copyWith(color: widget.foregroundColor ?? Colors.white),
                  child: widget.child,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}