import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../utils/app_assets.dart';

class DriverCarOnMap extends StatelessWidget {
  final double? height;
  final double? width;
  final double? top;
  final double? left;
  final double? right;
  final double? bottom;
  final String? carIconPath;
  final Color? tintColor;
  final BoxFit? fit;
  final AlignmentGeometry? alignment;
  final double? rotationAngle; // in degrees

  const DriverCarOnMap({
    Key? key,
    this.height,
    this.width,
    this.top,
    this.left,
    this.right,
    this.bottom,
    this.carIconPath,
    this.tintColor,
    this.fit,
    this.alignment,
    this.rotationAngle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      right: right,
      bottom: bottom,
      child: Transform.rotate(
        angle: rotationAngle != null ? (rotationAngle! * pi / 180) : 0,
        child: SizedBox(
          height: height ?? 35.86.h,
          width: width,
          child: Image.asset(
            carIconPath ?? AppAssets.carIcon,
            color: tintColor,
            // fit: fit ?? BoxFit.contain,
            alignment: alignment ?? Alignment.center,
          ),
        ),
      ),
    );
  }
}