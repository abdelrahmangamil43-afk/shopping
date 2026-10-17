import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';

class AuthNavigatorWidget extends StatelessWidget {
  const AuthNavigatorWidget({
    super.key,
    required this.text,
    required this.actionText,
    required this.onTap,
  });

  final String text;
  final String actionText;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text, style: Theme.of(context).textTheme.labelMedium),
        GestureDetector(
          onTap: onTap,
          child: Text(
            actionText,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.primaryOrange,
            ),
          ),
        ),
      ],
    );
  }
}
