import 'package:flutter/material.dart';
import 'package:getx_mvvm/res/colors/Colors.dart';

class RoundButtonWithIconBorder extends StatelessWidget {
  const RoundButtonWithIconBorder({
    Key? key,
    this.buttonColor = AppColors.primaryColor,
    this.textColor = AppColors.blackColor,
    required this.title,
    required this.onPress,
    this.width = 60,
    this.height = 50,
    this.loading = false,
    this.icon,
    this.disabledColor = AppColors.disabledColor,
    this.customBorderRadius,
  }) : super(key: key);

  final bool loading;
  final Color buttonColor;
  final Color textColor;
  final Color disabledColor;
  final String title;
  final Function() onPress;
  final double width;
  final double height;
  final IconData? icon;
  final BorderRadius? customBorderRadius;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: loading ? null : onPress,
        style: ElevatedButton.styleFrom(
          primary: loading ? disabledColor : buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: customBorderRadius ?? BorderRadius.circular(height / 2),
          ),
        ),
        child: loading
            ? CircularProgressIndicator(
          color: textColor,
        )
            : Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) Icon(icon, color: textColor),
            if (icon != null) SizedBox(width: 8), // Add some spacing
            Text(
              title,
              style: TextStyle(
                color: textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
