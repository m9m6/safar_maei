import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../utils/app_assets.dart';
import '../../../../utils/app_colors.dart';

class MyDestination extends StatelessWidget {
  final double? height;
  final double? width;
  final double? top;
  final double? left;
  final double? right;
  final double? bottom;
  final String? iconPath;
  final Color? iconColor;
  final BoxFit? fit;
  final AlignmentGeometry? alignment;
  final double? rotationAngle;
  final String? message;
  final Color? messageColor;
  final Color? messageBgColor;

  const MyDestination({
    Key? key,
    this.height,
    this.width,
    this.top,
    this.left,
    this.right,
    this.bottom,
    this.iconPath,
    this.iconColor,
    this.fit,
    this.alignment,
    this.rotationAngle,
    this.message,
    this.messageColor = Colors.white,
    this.messageBgColor = AppColors.secondaryColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      right: right,
      bottom: bottom,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (message != null) ...[

            // Message bubble
            Stack(
              clipBehavior: Clip.none,
              children: [
                // Message container
                Container(
                  height: 20.21.h,
                  width: 51.w,
                  constraints: BoxConstraints(
                    // minWidth: 40.w,  // Minimum width for small messages
                    // maxWidth: 150.w, // Maximum width before text wraps
                  ),
                  decoration: BoxDecoration(
                    color: messageBgColor,
                    borderRadius: BorderRadius.circular(25.r),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x333E4958),
                        blurRadius: 20.r,
                        spreadRadius: 0,
                        offset: Offset(0, 0),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      message!,
                      style: GoogleFonts.poppins(
                        fontSize: 10.sp,
                        color: messageColor,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                // Triangle pointer
                Positioned(
                  bottom: -5.h,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: CustomPaint(
                      size: Size(16.w, 8.h),
                      painter: _TrianglePainter(color: messageBgColor!),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.h),
          ],
          // Icon with optional rotation
          Transform.rotate(
            angle: rotationAngle != null ? (rotationAngle! * pi / 180) : 0,
            child: SizedBox(
              height: height ?? 40.h,
              width: width ?? 40.w,
              child: Image.asset(
                iconPath ?? AppAssets.myPickUpIcon,
                fit: fit ?? BoxFit.contain,
                color: iconColor,
                alignment: alignment ?? Alignment.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Custom painter for the triangle pointer
class _TrianglePainter extends CustomPainter {
  final Color color;

  _TrianglePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width / 2, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}