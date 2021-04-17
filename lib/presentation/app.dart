import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Placeholder Title',
      home: Navigator(
        pages: [
          MaterialPage(child: DemoPage()),
        ],
        onPopPage: (route, result) {
          if (route.didPop(result)) {
            return true;
          }

          return false;
        },
      ),
    );
  }
}

class DemoPage extends StatefulWidget {
  @override
  _DemoPageState createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  final _log = Logger('Demo Page');

  @override
  void initState() {
    super.initState();
    _log.info('initState working...');

    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _log.fine('Successfully built :)');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Demo Page'),
      ),
      body: SafeArea(
        child: Center(
          child: Text(
            'Welcome To\nStarter Architecture Example',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
      ),
    );
  }
}
