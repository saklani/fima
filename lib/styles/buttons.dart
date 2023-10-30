import 'package:flutter/material.dart';

import 'colors.dart';
import 'spacing.dart';


class RoundedButton extends StatelessWidget {
  final String label;
  final void Function() onPressed;
  final Widget? leading;
  final Color color;
  final double? width;
  final bool disabled;

  const RoundedButton({
    required this.label,
    required this.onPressed,
    this.leading,
    this.color = zeus,
    this.width,
    this.disabled = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: disabled ? null : onPressed,
      child: Container(
        height: 42,
        width: width ?? 175,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            if (leading != null) ...[leading!, shSpacing],
            Text(
              label,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.apply(color: Colors.white),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}