import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../utils/extensions/theme_ext.dart';
import 'widgets/language_selection.dart';
import 'widgets/theme_selection.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isLangExpanded = false;
  bool isThemeExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backwardsCompatibility: false,
        backgroundColor: Theme.of(context).statusBarColor,
        brightness: Brightness.light,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Theme.of(context).statusBarColor,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: ExpansionPanelList(
              expansionCallback: (int index, bool isExpanded) {
                setState(() {
                  if (index == 0) {
                    isLangExpanded = !isExpanded;
                  } else if (index == 1) {
                    isThemeExpanded = !isExpanded;
                  }
                });
              },
              children: [
                ExpansionPanel(
                  isExpanded: isLangExpanded,
                  headerBuilder: (_, isExpanded) {
                    return ListTile(
                      title: Text('Language'),
                    );
                  },
                  body: LanguageSelection(),
                ),
                ExpansionPanel(
                  isExpanded: isThemeExpanded,
                  headerBuilder: (_, isExpanded) {
                    return ListTile(
                      title: Text('Theme'),
                    );
                  },
                  body: ThemeSelection(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
