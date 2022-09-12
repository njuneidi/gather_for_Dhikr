import 'package:flutter/material.dart';

class AppHeaderBar extends StatelessWidget with PreferredSizeWidget {
  const AppHeaderBar({
    Key? key,
    this.title,
    this.actions,
    this.leading,
    this.backgroundColor,
  }) : super(key: key);
  final Widget? title;
  final List<Widget>? actions;
  final Widget? leading;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: backgroundColor,
      title: title,
      actions: actions,
      leading: leading,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60.0);
}
