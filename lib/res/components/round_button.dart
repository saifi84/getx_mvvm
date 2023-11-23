import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  const RoundButton({
    Key? key,
    this.buttonColor = Colors.blue,
    this.textColor = Colors.white,
    required this.title,
    this.onPress, // Making onPress nullable
    this.width = 60,
    this.height = 50,
    this.loading = false,
  }) : super(key: key);

  final bool loading;
  final Color buttonColor;
  final Color textColor;
  final String title;
  final Function()? onPress; // Nullable function
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: loading ? null : onPress,
        style: ElevatedButton.styleFrom(
          primary: buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(height / 2),
          ),
        ),
        child: loading
            ? CircularProgressIndicator(
          color: textColor,
        )
            : Text(
          title,
          style: TextStyle(
            color: textColor,
          ),
        ),
      ),
    );
  }
}
