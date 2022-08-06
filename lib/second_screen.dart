import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text(
          'This is Navigation Page',
          style: TextStyle(
            fontSize: 25.0,
          ),
        ),
      ),
    );
  }
}
