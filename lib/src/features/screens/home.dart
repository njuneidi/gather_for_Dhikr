import 'package:dhikr/src/common_widgets/custom_image.dart';
import 'package:dhikr/src/common_widgets/empty_placeholder_widget.dart';
import 'package:dhikr/src/common_widgets/responsive.dart';
import 'package:dhikr/src/common_widgets/responsive_center.dart';
import 'package:dhikr/src/constants/app_sizes.dart';
import 'package:dhikr/src/features/dhikr/presentation/grid_view_item.dart';
import 'package:dhikr/src/localization/app_localizations_context.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_dismissOnScreenKeyboard);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_dismissOnScreenKeyboard);
    super.dispose();
  }

  // When the search text field gets the focus, the keyboard appears on mobile.
  // This method is used to dismiss the keyboard when the user scrolls.
  void _dismissOnScreenKeyboard() {
    if (FocusScope.of(context).hasFocus) {
      FocusScope.of(context).unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView( controller: _scrollController, slivers: [
        ResponsiveSliverCenter(
          padding: const EdgeInsets.all(defaultPadding),
          child: GridViewItem(),
        ),
      ]),
    );
  }
}

