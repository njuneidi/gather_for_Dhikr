import 'package:dhikr/src/common_widgets/primary_button.dart';
import 'package:dhikr/src/constants/app_sizes.dart';
import 'package:dhikr/src/constants/enum_constant.dart';
import 'package:dhikr/src/localization/app_localizations_context.dart';
import 'package:dhikr/src/routing/app_routing_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:go_router/go_router.dart';

/// Placeholder widget showing a message and CTA to go back to the home screen.
class EmptyPlaceholderWidget extends ConsumerWidget {
  const EmptyPlaceholderWidget({Key? key, required this.message})
      : super(key: key);
  final String message;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              message,
              style: Theme.of(context).textTheme.headline4,
              textAlign: TextAlign.center,
            ),
            gapH32,
            PrimaryButton(
              onPressed: () {
                context.goNamed(AppRouter.dashboard.name);
                ref
                    .read(pageNotifierProvider.notifier)
                    .selectedPage(AppRouter.home.name);
              },
              text: context.loc.goHome,
            )
          ],
        ),
      ),
    );
  }
}
