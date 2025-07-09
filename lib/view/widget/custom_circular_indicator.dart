import 'package:flutter/material.dart';

import '../../utils/AppColors/app_colors.dart';

class CustomCircularIndicator extends StatelessWidget {
  const CustomCircularIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: AnimatedRotation(
        turns: 1,
        duration: Duration(seconds: 1),
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(AppColors.blue300),
          strokeWidth: 1.0,
        ),
      ),
    );
  }
}

