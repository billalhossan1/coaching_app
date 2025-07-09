import 'package:flutter/material.dart';

import '../../../../utils/AppColors/app_colors.dart';
import '../../../../utils/Texts/text_style.dart';

class SeeMoreTextWidget extends StatefulWidget {
  final String text;
  final int maxLines;

  const SeeMoreTextWidget({
    Key? key,
    required this.text,
    this.maxLines = 3,
  }) : super(key: key);

  @override
  State<SeeMoreTextWidget> createState() => _SeeMoreTextWidgetState();
}

class _SeeMoreTextWidgetState extends State<SeeMoreTextWidget> {
  bool _isExpanded = false;
  bool _hasOverflow = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkTextOverflow();
    });
  }

  void _checkTextOverflow() {
    final textPainter = TextPainter(
      text: TextSpan(
        text: widget.text,
        style: TextStyles.regular12.copyWith(
          fontWeight: FontWeight.w400,
          color: AppColors.white700,
        ),
      ),
      maxLines: widget.maxLines,
      textDirection: TextDirection.ltr,
    );

    textPainter.layout(maxWidth: MediaQuery.of(context).size.width - 32); // Adjust padding as needed

    if (mounted) {
      setState(() {
        _hasOverflow = textPainter.didExceedMaxLines;
      });
    }
    textPainter.dispose();
  }

  void _toggleExpanded() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.text,
          maxLines: _isExpanded ? null : widget.maxLines,
          overflow: _isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
          style: TextStyles.regular12.copyWith(
            fontWeight: FontWeight.w400,
            color: AppColors.white700,
          ),
        ),

        // Only show buttons if text actually overflows
        if (_hasOverflow) ...[
          const SizedBox(height: 4),
          GestureDetector(
            onTap: _toggleExpanded,
            child: Text(
              _isExpanded ? 'See less' : 'See more',
              style: const TextStyle(
                color: Colors.blue,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ],
    );
  }
}