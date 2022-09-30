import 'package:flutter/material.dart';

class StoryTabBarView extends StatelessWidget {
  const StoryTabBarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 300,
            color: Colors.purple,
          ),
          Container(
            height: 300,
            color: Colors.pink,
          ),
          Container(
            height: 300,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
