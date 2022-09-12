import 'dart:async';

import 'package:dhikr/src/localization/localizations_controller.dart';
import 'package:dhikr/src/localization/localizations_service.dart';
import 'package:dhikr/src/localization/string_hardcoded.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'src/app.dart';
import 'src/settings/settings_controller.dart';
import 'src/settings/settings_service.dart';

void main() async {
  // Set up the SettingsController, which will glue user settings to multiple
  // Flutter Widgets.
  final settingsController = SettingsController(SettingsService());

  // Load the user's preferred theme while the splash screen is displayed.
  // This prevents a sudden theme change when the app is first displayed.
  await settingsController.loadSettings();

  // Run the app and pass in the SettingsController. The app listens to the
  // SettingsController for changes, then passes it further down to the
  // SettingsView.
  final localizationsController =
      LocalizationsController(LocalizationsService());
  await localizationsController.loadSettings();

  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    GoRouter.setUrlPathStrategy(UrlPathStrategy.path);

    runApp(
      ProviderScope(
        child: MyApp(
            settingsController: settingsController,
            localizationsController: localizationsController),
      ),
    );
    // * This code will present some error UI if any uncaught exception happens
    FlutterError.onError = (FlutterErrorDetails details) {
      FlutterError.presentError(details);
    };
    ErrorWidget.builder = (FlutterErrorDetails details) {
      return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.red,
            title: const Text('anErrorOccurred(BuildContext)'),
          ),
          body: Center(child: Text(details.toString())),
        ),
      );
    };
  }, (Object error, StackTrace stack) {
    // * Log any errors to console
    debugPrint(error.toString());
  });
}

String anErrorOccurred(context) => context.loc.anErrorOccurred;
