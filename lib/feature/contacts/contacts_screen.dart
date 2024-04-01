import 'package:flutter/material.dart';
import 'package:flutter_zoom/utils/string_util.dart';

class ContactsScreen extends StatelessWidget {
  const ContactsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(StringUtil.contacts),
        ),
        body: const Center(child: Text(StringUtil.contacts)));
  }
}
