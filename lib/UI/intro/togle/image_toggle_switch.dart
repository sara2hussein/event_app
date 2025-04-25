import 'package:event_app/utels/app_colors.dart';
import 'package:flutter/material.dart';

class ImageToggleSwitch extends StatefulWidget {
  final String firstImagePath;
  final String secondImagePath;
  final Function(int index)? onToggle;

  const ImageToggleSwitch({
    Key? key,
    required this.firstImagePath,
    required this.secondImagePath,
    this.onToggle,
  }) : super(key: key);

  @override
  _ImageToggleSwitchState createState() => _ImageToggleSwitchState();
}

class _ImageToggleSwitchState extends State<ImageToggleSwitch> {
  bool isFirstSelected = true;

  void _handleToggle(bool selectFirst) {
    setState(() {
      isFirstSelected = selectFirst;
    });
    if (widget.onToggle != null) {
      widget.onToggle!(selectFirst ? 0 : 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () => _handleToggle(true),
          child: Container(
            decoration: BoxDecoration(
              color: isFirstSelected ? AppColors.primaryLight : Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            padding: EdgeInsets.all(8),
            child: Image.asset(widget.firstImagePath, height: 20),
          ),
        ),
        SizedBox(width: 10),
        GestureDetector(
          onTap: () => _handleToggle(false),
          child: Container(
            decoration: BoxDecoration(
              color: !isFirstSelected ? AppColors.primaryLight : Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            padding: EdgeInsets.all(8),
            child: Image.asset(widget.secondImagePath, height: 20),
          ),
        ),
      ],
    );
  }
}
