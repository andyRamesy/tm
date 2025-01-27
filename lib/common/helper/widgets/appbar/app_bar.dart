import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tmdb_clean/core/configs/theme/app_colors.dart';

class BasicAppbar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final Widget? action;
  final Color? backgroundColor;
  final bool hideBack;
  final double? height;
  final Widget? leading;
  const BasicAppbar(
      {this.title,
      this.hideBack = false,
      this.action,
      this.backgroundColor,
      this.height,
      this.leading,
      super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? Colors.transparent,
      elevation: 0,
      centerTitle: true,
      automaticallyImplyLeading: false,
      toolbarHeight: height ?? 80,
      title: title ?? const Text(''),
      titleSpacing: 0,
      actions: [action ?? Container()],
      leading: hideBack
          ? null
          : IconButton(
              onPressed: () {
                // Navigator.pop(context);
              },
              icon: Container(
                height: 100,
                width: 100,
                decoration: const BoxDecoration(
                    color: AppColors.secondBackground, shape: BoxShape.circle),
                child: leading ,
              ),
            ),
      
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height ?? 80);
}
