import 'package:flutter/material.dart';

class MeetingScreen extends StatelessWidget {
  const MeetingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Meetings'),
        ),
        body: Center(child: Text('Meetings')));
  }
}
