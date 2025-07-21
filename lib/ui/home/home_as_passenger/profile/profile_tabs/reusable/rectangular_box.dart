import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RectangularBox extends StatefulWidget {
  final double width;
  final double height;
  final Color backgroundColor;
  final Color borderColor;
  final Color? pressedColor;
  final double borderWidth;
  final double borderRadius;
  final String? imagePath;
  final String? text;
  final TextStyle? textStyle;
  final double? imageSize;
  final Widget? customChild;
  final VoidCallback? onTap;
  final bool isClickable;

  const RectangularBox({
    super.key,
    required this.width,
    required this.height,
    this.backgroundColor = Colors.white,
    this.borderColor = Colors.transparent,
    this.pressedColor,
    this.borderWidth = 1,
    this.borderRadius = 16,
    this.imagePath,
    this.text,
    this.textStyle,
    this.imageSize,
    this.customChild,
    this.onTap,
    this.isClickable = false,
  });

  @override
  State<RectangularBox> createState() => _RectangularBoxState();
}

class _RectangularBoxState extends State<RectangularBox> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final container = Container(
      width: widget.width.w,
      height: widget.height.h,
      decoration: BoxDecoration(
        color: _isPressed && widget.isClickable
            ? widget.pressedColor ?? widget.backgroundColor
            : widget.backgroundColor,
        borderRadius: BorderRadius.circular(widget.borderRadius.r),
        border: Border.all(
          color: widget.borderColor,
          width: widget.borderWidth.w,
        ),
      ),
      child: Center(
        child: widget.customChild ?? _buildDefaultContent(),
      ),
    );

    return widget.isClickable && widget.onTap != null
        ? GestureDetector(
      onTapDown: (_) {
        if (widget.pressedColor != null) {
          setState(() => _isPressed = true);
        }
      },
      onTapUp: (_) {
        if (widget.pressedColor != null) {
          setState(() => _isPressed = false);
        }
        widget.onTap!();
      },
      onTapCancel: () {
        if (widget.pressedColor != null) {
          setState(() => _isPressed = false);
        }
      },
      child: container,
    )
        : container;
  }

  Widget _buildDefaultContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (widget.imagePath != null)
          Image.asset(
            widget.imagePath!,
            height: widget.imageSize?.h ?? 32.h,
            width: widget.imageSize?.w ?? 32.w,
          ),
        if (widget.text != null)
          Padding(
            padding: EdgeInsets.only(top: 8.h),
            child: Text(
              widget.text!,
              style: widget.textStyle,
            ),
          ),
      ],
    );
  }
}