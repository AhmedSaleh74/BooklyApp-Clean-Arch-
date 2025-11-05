import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final double? width;
  final double height;
  final VoidCallback onPressed;
  final BorderRadius borderRadius;

  /// السماكة واللون لكل جهة
  final BorderSide topBorder;
  final BorderSide bottomBorder;
  final BorderSide leftBorder;
  final BorderSide rightBorder;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.textColor = Colors.white,
    this.borderRadius = BorderRadius.zero,
    this.width,
    this.height = 50,
    this.topBorder = BorderSide.none,
    this.bottomBorder = BorderSide.none,
    this.leftBorder = BorderSide.none,
    this.rightBorder = BorderSide.none,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height,
      child: InkWell(
        borderRadius: borderRadius,
        onTap: onPressed,
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: borderRadius,
            border: Border(
              top: topBorder,
              bottom: bottomBorder,
              left: leftBorder,
              right: rightBorder,
            ),
          ),
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
