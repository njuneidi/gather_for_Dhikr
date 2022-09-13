import 'package:dhikr/src/common_widgets/responsive.dart';
import 'package:dhikr/src/constants/enum_constant.dart';
import 'package:dhikr/src/common_widgets/app_header_bar.dart';
import 'package:dhikr/src/features/screens/about_us.dart';
import 'package:dhikr/src/features/screens/dashboard.dart';
import 'package:dhikr/src/features/screens/favorite.dart';
import 'package:dhikr/src/features/screens/home.dart';
import 'package:dhikr/src/features/screens/settings.dart';
import 'package:dhikr/src/features/screens/side_menue.dart';
import 'package:dhikr/src/localization/app_localizations_context.dart';
import 'package:dhikr/src/routing/app_routing_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final page = ref.watch(pageNotifierProvider);
    debugPrint('page $page');
    //final sideMenuController = SideMenuController();

    return Scaffold(
      //key: context.read<MenuController>().scaffoldKey,
      appBar: AppHeaderBar(
        title: Text(context.loc.appTitle, overflow: TextOverflow.clip,),
      ),

      drawer: Responsive.isDesktop(context) == false ? SideMenu() : null,
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (Responsive.isDesktop(context)) Expanded(child: SideMenu()),
            Expanded(
              flex: 5,
              child: displayScreen(page),
            )
          ],
        ),
      ),
    );
  }

  Widget displayScreen(String page) {
    if (page == AppRouter.dashboard.name) {
      return const Dashboard();
    } else if (page == AppRouter.home.name) {
      return const Home();
    } else if (page == AppRouter.settings.name) {
      return const Settings();
    } else if (page == AppRouter.favorite.name) {
      return const Favorite();
    } else if (page == AppRouter.aboutUs.name) {
      return const AboutUs();
    } else {
      return const MainScreen();
    }
  }
}
