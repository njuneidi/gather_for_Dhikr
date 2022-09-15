import 'package:dhikr/src/common_widgets/custom_image.dart';
import 'package:dhikr/src/constants/app_sizes.dart';
import 'package:dhikr/src/features/dhikr/domain/dhikr.dart';
import 'package:flutter/material.dart';

class AzkarCard extends StatelessWidget {
  const AzkarCard({
    Key? key,
    required this.dhikr,
    this.onRightTap,
    this.onLeftTap,
  }) : super(key: key);
  final Dhikr dhikr;
  final VoidCallback? onRightTap;
  final VoidCallback? onLeftTap;

  static const dhikrCardKey = Key('dhikr-card');

  @override
  Widget build(BuildContext context) {
    return Card(
      
      child: InkWell(
        key: dhikrCardKey,
        onTap: onRightTap,
       // onTapDown: onLeftTap,
        child: Padding(
          padding: const EdgeInsets.all(defaultPadding/defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children:  [
              CustomImage(imageUrl: dhikr.imageUrl)
            ],
          ),
        ),
      ),
    );
  }
}
