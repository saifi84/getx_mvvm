import 'package:flutter/material.dart';
import 'package:getx_mvvm/res/widgets/round_button.dart';

class ExceaptonWidget extends StatelessWidget {
  final String? errorMessage;
  final VoidCallback? onRetry;

  ExceaptonWidget({required this.errorMessage, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error,
            color: Colors.red,
            size: 50.0,
          ),
          SizedBox(height: 16.0),
          Text(
            errorMessage!,
            style: TextStyle(fontSize: 16.0),
          ),
          SizedBox(height: 16.0),
          RoundButton(
            width: 100,
            onPress: onRetry,
            title: 'Retry',
          ),
        ],
      ),
    );
  }
}
