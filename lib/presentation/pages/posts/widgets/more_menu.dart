import 'package:flutter/material.dart';

class MoreMenu extends StatelessWidget {
  const MoreMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      itemBuilder: (_) {
        return <PopupMenuEntry<String>>[];
      },
    );
  }
}
