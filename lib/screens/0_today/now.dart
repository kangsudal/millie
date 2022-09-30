
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class NowTabBarView extends StatelessWidget {
  const NowTabBarView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          NewWidget(),
          NewWidget2(),
          NewWidget3(),
          NewWidget4(),
        ],
      ),
    );
  }
}

class NewWidget4 extends StatelessWidget {
  const NewWidget4({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: Colors.pink,
    );
  }
}

class NewWidget3 extends StatelessWidget {
  const NewWidget3({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: Colors.yellow,
    );
  }
}

class NewWidget2 extends StatelessWidget {
  const NewWidget2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: Colors.pink,
    );
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(height: 300.0),
      items: [1, 2, 3, 4, 5].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                    color: Colors.amber
                ),
                child: Text('text $i', style: TextStyle(fontSize: 16.0),)
            );
          },
        );
      }).toList(),
    );
  }
}