import 'package:dhikr/src/features/mobile_menu/domain/menu_item.dart';
import 'package:dhikr/src/routing/app_routing_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BottomMenu extends ConsumerWidget {
  const BottomMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
     final page = ref.read(pageNotifierProvider.notifier);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Wrap(
        alignment: WrapAlignment.center,
        children: <Widget>[
          const Divider(color: Colors.black, height: 1),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  InkWell(
                    borderRadius:  BorderRadius.circular(20.0),
                    customBorder: Border.all(color: Colors.black),
                    child: Container(
                      padding: const EdgeInsets.only(
                          left: 3, right: 6, bottom: 15, top: 11),
                      child: Row(
                        children: const <Widget>[
                           Icon(Icons.menu),
                           Text('Show menu', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    onTap: () {
                      Scaffold.of(context).openDrawer();
                     
                    },
                  ),
                ],
              ),
          ),
        ],
      ),
    );
  }}