import 'package:flab/state_mngmnt/inherited/models/log_provider.dart';
import 'package:flutter/material.dart';

class LogHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LogProvider logProvider = LogProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Log History'),
        backgroundColor: logProvider.color,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
            child: ListTile(
              title: Text(logProvider.log.logHistory),
            ),
        ),
      ),
    );
  }
}