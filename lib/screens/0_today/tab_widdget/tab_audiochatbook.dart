import 'package:flutter/material.dart';

class AudioBookTabBarView extends StatelessWidget {
  const AudioBookTabBarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 300,
            color: Colors.yellow,
          ),
          Container(
            height: 300,
            color: Colors.green,
          ),
          Container(
            height: 300,
            color: Colors.yellow,
          ),
        ],
      ),
    );
  }
}
