import 'package:dhikr/src/common_widgets/empty_placeholder_widget.dart';
import 'package:dhikr/src/common_widgets/app_header_bar.dart';
import 'package:dhikr/src/localization/app_localizations_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Dashboard extends ConsumerWidget {
  const Dashboard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
    
      body: EmptyPlaceholderWidget(
        message: context.loc.mainPage,
      ),
    );
  }
}
