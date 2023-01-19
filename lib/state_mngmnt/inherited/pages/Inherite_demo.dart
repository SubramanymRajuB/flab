import 'package:flutter/material.dart';

import 'inherited_model_page.dart';
import 'inherited_widget_page.dart';
import 'value_notifier_page.dart';

class InheritedDemo extends StatefulWidget {
  @override
  _InheritedDemoState createState() => _InheritedDemoState();
}

class _InheritedDemoState extends State<InheritedDemo>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  List _listPages = [];
  Widget _currentPage;

  @override
  void initState() {
    super.initState();

    _listPages
      ..add(InheritedWidgetPage())
      ..add(InheritedModelPage())
      ..add(ValueNotifierPage());
    _currentPage = InheritedWidgetPage();
  }

  void _changePage(int selectedIndex) {
    setState(() {
      _currentIndex = selectedIndex;
      _currentPage = _listPages[selectedIndex];
    });
  }

  Color _selectedColor(int index) {
    if (index == 0) return Colors.lightGreen;
    if (index == 1) return Colors.blueGrey;
    if (index == 2) return Colors.orange;
    return Colors.lightGreen;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: _selectedColor(_currentIndex),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_input_hdmi),
            label: 'InheritedWidget',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.lightbulb_outline),
            label: 'InheritedModel',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.hearing),
            label: 'ValueNotifier',
          ),
        ],
        onTap: _changePage,
      ),
      body: _currentPage,
    );
  }
}
