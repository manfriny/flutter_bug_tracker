import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bug Tracker'),
        centerTitle: true,
      ),
      body: Column(
        children: [],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamed(context, '/new_issue');
        },
        icon: const Icon(Icons.add),
        label: const Text('New Issue'),
      ),
    );
  }
}
