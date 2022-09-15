import 'dart:math';

import 'package:dhikr/src/common_widgets/async_value_widget.dart';
import 'package:dhikr/src/common_widgets/custom_image.dart';
import 'package:dhikr/src/constants/app_sizes.dart';
import 'package:dhikr/src/features/dhikr/data/fake_dhikr_repository.dart';
import 'package:dhikr/src/features/dhikr/domain/dhikr.dart';
import 'package:dhikr/src/features/dhikr/presentation/azkar_card.dart';
import 'package:dhikr/src/localization/string_hardcoded.dart';
import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GridViewItem extends ConsumerWidget {
  GridViewItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final azkarListValue = ref.watch(azkarListStreamProvider);
    return AsyncValueWidget<List<Dhikr>>(
        value: azkarListValue,
        data: (azkar) => azkar.isEmpty
            ? Center(
                child: Text('No Dhikr Pages found'.hardcoded),
              )
            : AzkarLayoutGrid(itemCount: azkar.length, itemBuilder: (_, index) {
              final dhikr = azkar[index];
              return AzkarCard(dhikr: dhikr,onRightTap: () => null,);
              
              
            },));
  }
}

class AzkarLayoutGrid extends StatelessWidget {
  const AzkarLayoutGrid(
      {Key? key, required this.itemCount, required this.itemBuilder})
      : super(key: key);
  final int itemCount;
  final Widget Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        // 1 column for width < 500px
        // then add one more column for each 250px
        final crossAxisCount = max(1, width ~/ width);
        // once the crossAxisCount is known, calculate the column and row sizes
        // set some flexible track sizes based on the crossAxisCount with 1.fr
        final columnSizes = List.generate(crossAxisCount, (_) => 1.fr);
        final numRows = (itemCount / crossAxisCount).ceil();
        // set all the row sizes to auto (self-sizing height)
        final rowSizes = List.generate(numRows, (_) =>auto);
        return LayoutGrid(
          columnSizes: columnSizes,
          rowSizes: rowSizes,
          rowGap: Sizes.p24,
          columnGap: Sizes.p24,
          children: [
            for (var i = 0; i < itemCount; i++) itemBuilder(context, i)
          ],
        );
      },
    );
  }
}
