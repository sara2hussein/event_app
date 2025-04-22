import 'package:flutter/material.dart';

class AddEventScreen extends StatelessWidget {
  static const String routeName = '/add-event';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add New Event')),
      body: Center(child: Text('This is the Add Event Page')),
    );
  }
}
