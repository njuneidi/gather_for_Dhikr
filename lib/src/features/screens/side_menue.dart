// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:dhikr/src/constants/app_sizes.dart';

import 'package:dhikr/src/features/mobile_menu/domain/menu_item.dart';
import 'package:dhikr/src/routing/app_routing_controller.dart';

class SideMenu extends ConsumerWidget {
  SideMenu({
    Key? key,
  }) : super(key: key);

  final controller = ScrollController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final page = ref.read(pageNotifierProvider.notifier);

    return Drawer(
      child: SingleChildScrollView(
        controller: controller,
        child: Column(
          children: [
            gapH20,
            DrawerHeader(
              child: Image.asset(
                'assets/images/logo.png',
              ),
            ),
            gapH24,
            for (var i = 0; i < sideMenuItems(context).length; i++) ...[
              DrawListTitle(
                menuItem: sideMenuItems(context)[i],
                press: () {
                  page.selectedPage(sideMenuItems(context)[i].name!);

                  Scaffold.of(context).closeDrawer();
                },
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: Divider.createBorderSide(context),
                  ),
                ),
                padding: const EdgeInsets.all(1),
              )
            ]
          ],
        ),
      ),
    );
  }
}

class DrawListTitle extends StatefulWidget {
  const DrawListTitle({
    Key? key,
    required this.menuItem,
    required this.press,
  }) : super(key: key);

  final SideMenuItem menuItem;
  final VoidCallback press;

  @override
  State<DrawListTitle> createState() => _DrawListTitleState();
}

class _DrawListTitleState extends State<DrawListTitle> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: widget.press,
      horizontalTitleGap: 15.0,
      title: Text(widget.menuItem.title!),
      leading: ImageIcon(widget: widget),
      trailing: const Icon(Icons.navigate_next),
    );
  }
}

class ImageIcon extends StatelessWidget {
  const ImageIcon({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final DrawListTitle widget;

  @override
  Widget build(BuildContext context) {
    return Container(
        //  color: primaryColor,
        //height: 450,
        //decoration: BorderRadius.all(10),
        //color: primaryColor,
        decoration: const BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.all(Radius.circular(25)),
        ),
        padding: const EdgeInsets.all(Sizes.p12),
        child: Image.asset('assets/images/${widget.menuItem.imgSrc}'));
  }
}
