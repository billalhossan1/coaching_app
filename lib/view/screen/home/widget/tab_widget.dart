import 'package:flutter/material.dart';

import '../../../widget/responsive_design.dart';

class TabWidget extends StatelessWidget {
  final String tabStatus;

  const TabWidget({
    super.key,
    required this.tabStatus,
  });

  @override
  Widget build(BuildContext context) {
    return Tab(
      height: Responsive.height(context, 40),
      child: Center(
        child: Text(
          tabStatus,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}