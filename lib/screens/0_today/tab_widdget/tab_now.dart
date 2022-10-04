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

class NewWidget extends StatefulWidget {
  const NewWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<NewWidget> createState() => _NewWidgetState();
}

class _NewWidgetState extends State<NewWidget> {
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    final dataList = [
      {
        'title': '책 추천 맛집 밀리, \n6명의 큐레이터 공개',
        'subTitle': '무슨 책을 읽을지 고민이라면 주목!',
        'img': 'images/library.png',
        // 'https://images.unsplash.com/photo-1497354861845-d381fb7c91a8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
      },
      {
        'title': '둘 중 어느영상이 AI작품을까요?',
        'subTitle': 'AI가 영상을 만들 수 있다고?',
        'img': 'images/bear.png',
        // 'https://images.unsplash.com/photo-1539606328118-80c679838702?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=327&q=80',
      },
      {
        'title': '소중한 저작권 \n함께 지켜요!',
        'subTitle': '이벤트 참여하고 바나나 우유받기',
        'img': 'images/banana.png',
        // 'https://images.unsplash.com/photo-1528825871115-3581a5387919?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=415&q=80',
      }
    ];
    return Stack(
      children: [
        Container(
          color: Colors.primaries[currentPage].withOpacity(0.5),
          height: 230,
        ),
        CarouselSlider.builder(
          options: CarouselOptions(
              viewportFraction: 1,
              height: 300.0,
              autoPlay: true,
              onPageChanged: (index, reason) {
                setState(() {
                  currentPage = index;
                });
              }),
          itemCount: 3,
          itemBuilder: (BuildContext context, int index, int realIndex) {
            final String title = dataList[index]['title'] ?? 'title';
            final subTitle = dataList[index]['subTitle'] ?? 'subTitle';
            final img = dataList[index]['img'] ?? 'images/bear.png';
            // 'https://images.unsplash.com/photo-1497354861845-d381fb7c91a8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80';

            return Stack(
              children: [
                Column(
                  children: [
                    Container(
                      height: 300,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 30),
                            ),
                            Text(
                              subTitle,
                              style: TextStyle(
                                  color: Colors.black38, fontSize: 20),
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: SizedBox(
                                child: Image.asset(
                                  img,
                                  fit: BoxFit.contain,
                                ),
                                width: 150,
                                height: 180,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
        Positioned(
          left: 30,
          bottom: 80,
          child: Container(
            margin: EdgeInsets.all(8),
            width: 60,
            height: 40,
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Center(
              child: Text(
                '$currentPage/${dataList.length}>',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
