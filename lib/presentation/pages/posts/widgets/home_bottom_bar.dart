import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeBottomBar extends StatefulWidget {
  @override
  _HomeBottomBarState createState() => _HomeBottomBarState();
}

class _HomeBottomBarState extends State<HomeBottomBar> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) {
        setState(() {
          currentIndex = index;
        });
      },
      items: [
        BottomNavigationBarItem(
          label: AppLocalizations.of(context)!.posts,
          icon: Icon(Icons.list_alt),
        ),
        BottomNavigationBarItem(
          label: AppLocalizations.of(context)!.profile,
          icon: Icon(Icons.account_circle_rounded),
        ),
      ],
    );
  }
}
