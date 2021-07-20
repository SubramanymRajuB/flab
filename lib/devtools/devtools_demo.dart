import 'package:flab/devtools/yellow.dart';
import 'package:flutter/material.dart';

import 'amber.dart';

class DevToolsDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          AmberPage(),
          YellowPage(),
        ],
      ),
    );
  }
}