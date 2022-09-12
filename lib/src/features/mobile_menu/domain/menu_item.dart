import 'package:dhikr/src/constants/enum_constant.dart';
import 'package:dhikr/src/localization/app_localizations_context.dart';
import 'package:flutter/material.dart';

class SideMenuItem {
  final String? svgSrc, title, name, imgSrc;

  final Color? color;

  SideMenuItem({
    this.name,
    this.svgSrc,
    this.title,
    this.color,
    this.imgSrc,
  });
}

late final BuildContext context;
List<SideMenuItem> sideMenuItems(BuildContext context) => [
      SideMenuItem(
        name: AppRouter.home.name,
        title: context.loc.homeMenuItem,
        svgSrc: '${AppRouter.home.name}.svg',
        imgSrc: '${AppRouter.home.name}.png',
      ),
      SideMenuItem(
        name: AppRouter.favorite.name,
        title: context.loc.favioriteMenuItem,
        svgSrc: '${AppRouter.favorite.name}.svg',
        imgSrc: '${AppRouter.favorite.name}.png',
      ),
      SideMenuItem(
        name: AppRouter.settings.name,
        title: context.loc.settingsMenuItem,
        svgSrc: '${AppRouter.settings.name}.svg',
        imgSrc: '${AppRouter.settings.name}.png',
      ),
      SideMenuItem(
        name: AppRouter.aboutUs.name,
        title: context.loc.aboutUsMenuItem,
        svgSrc: '${AppRouter.aboutUs.name}.svg',
        imgSrc: '${AppRouter.aboutUs.name}.png',
      ),
    ];
