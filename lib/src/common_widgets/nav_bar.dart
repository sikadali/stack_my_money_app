import 'package:flutter/material.dart';
import 'package:stack_my_money_app/src/constants/image_strings.dart';

class SNavBar extends StatelessWidget implements PreferredSizeWidget  {
  const SNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    final bool isDarkMode = mediaQuery.platformBrightness == Brightness.dark;

    return AppBar(
      actions: [
        IconButton(
          icon: const Icon(Icons.notifications),
          onPressed: () {},
        )
      ],
      flexibleSpace: Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: isDarkMode
              ? const Image(image: AssetImage(sHomeScreenWhiteImage))
              : const Image(image: AssetImage(sHomeScreenDarkImage))),
    );
  }


  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
