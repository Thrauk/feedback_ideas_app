import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class DesktopNavbarButton extends StatelessWidget {
  const DesktopNavbarButton({
    super.key,
    this.isSelected = false,
    this.onPressed,
    required this.buttonLabel,
  });

  final bool isSelected;
  final VoidCallback? onPressed;
  final String buttonLabel;

  @override
  Widget build(BuildContext context) {
    return ShadButton(
      onPressed: onPressed,
      width: double.infinity,
      // backgroundColor: isSelected ? ATColors.orange : ATColors.dark,
      // foregroundColor: Colors.white,
      // hoverBackgroundColor: isSelected ? ATColors.orangeButtonHover : ATColors.darkGreyButtonHover,
      // hoverForegroundColor: Colors.white,
      mainAxisAlignment: MainAxisAlignment.start,
      child: Text(buttonLabel),
    );
  }
}
