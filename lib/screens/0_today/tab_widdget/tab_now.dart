import 'dart:convert';
import 'dart:math';
import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:millie/models/book.dart';
import 'package:millie/riverpod/listen_provider.dart';

const double symmetricPadding = 20;

class NowTabBarView extends ConsumerStatefulWidget {
  const NowTabBarView({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<NowTabBarView> createState() => _NowTabBarViewState();
}

class _NowTabBarViewState extends ConsumerState<NowTabBarView> {
  final ScrollController _scrollController = ScrollController();
  bool showTitle = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.offset > 40) {
        if (showTitle) return; //이미 40 이상이면 true로 내버려둔다.
        ref.read(showTitleProvider.notifier).update((state) => true);
      } else {
        ref.read(showTitleProvider.notifier).update((state) => false);
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _scrollController,
      child: Column(
        children: [
          NewWidget(),
          NewWidget2(),
          NewWidget3(),
          // NewWidget4(),
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
      height: 800,
      color: Colors.pink,
      child: Column(
        children: [
          Container(),
          //tabbar로 구현해보기
          Container(),
          Container(),
        ],
      ),
    );
  }
}

class NewWidget3 extends StatefulWidget {
  const NewWidget3({
    Key? key,
  }) : super(key: key);

  @override
  State<NewWidget3> createState() => _NewWidget3State();
}

class _NewWidget3State extends State<NewWidget3> {
  late Future<List<Book>> futureBooks;
  String keyword = '20대 경제';
  int startIndex = 0;

  // int bookLength = 0; //result total books / totalItems 총 검색조회수가 아닌거같음.
  int itemCount = 6; //displayed book

  Future<List<Book>> fetchBooks() async {
    Uri url = Uri.parse(
        'https://www.googleapis.com/books/v1/volumes?q=$keyword&startIndex=$startIndex'); //&maxResults=1
    final response = await http.get(url);
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      // bookLength = json['totalItems'];
      List<dynamic> items = json['items'];
      List<Book> books = (items.map((item) {
        return Book.fromJson(item);
      })).toList();
      return books;
    } else {
      throw Exception('Failed to load Books');
    }
  }

  @override
  void initState() {
    super.initState();
    futureBooks = fetchBooks();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: symmetricPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //title
          Container(
            height: 70,
            // color: Colors.brown,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '당신을 위한 추천',
                  style: TextStyle(
                    color: Colors.black38,
                  ),
                ),
                Text.rich(TextSpan(
                  text: '요즘',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: ' 20대 여성',
                      style: TextStyle(
                        color: Colors.deepPurple,
                      ),
                    ),
                    TextSpan(
                      text: '이 많이 보는 ',
                      style: TextStyle(),
                    ),
                    TextSpan(
                      text: '경제경영',
                      style: TextStyle(
                        color: Colors.deepPurple,
                      ),
                    ),
                  ],
                )),
              ],
            ),
          ),
          //contents
          FutureBuilder<List<Book>>(
              future: futureBooks,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Container(
                    height: 300,
                    // color: Colors.yellow,
                    child: ListView.builder(
                      itemCount: itemCount,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          width: 250,
                          margin: EdgeInsets.only(top: 8, right: 16),
                          decoration: BoxDecoration(
                            // color: Colors.pink,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 230,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(15),
                                  ),
                                  child: Stack(
                                    children: [
                                      BluredBackgroundImgWidget(
                                          snapshot: snapshot, index: index),
                                      BookCoverWidget(
                                        snapshot: snapshot,
                                        index: index,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Text(
                                '${snapshot.data![index].title}',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                snapshot.data![index].authors[0],
                                style: TextStyle(
                                  color: Colors.black38,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('${snapshot.error}'),
                  );
                }
                return Center(child: CircularProgressIndicator());
              }),
          Align(
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    var rng = Random();
                    startIndex = rng.nextInt(
                        300); //총 검색량 수가 맞지않는것같아 임의로 300까지 랜덤값으로 startIndex를 줌
                    futureBooks = fetchBooks();
                  });
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: 40, top: 20),
                  // padding: EdgeInsets.symmetric(vertical: 8,horizontal: 80),
                  height: 40,
                  width: 300,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black38),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.refresh,
                        color: Colors.black38,
                      ),
                      Text(
                        '더 많이 발견하기',
                        style: TextStyle(color: Colors.black38),
                      ),
                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }
}

class BluredBackgroundImgWidget extends StatelessWidget {
  final AsyncSnapshot<List<Book>> snapshot;
  final int index;

  const BluredBackgroundImgWidget({
    Key? key,
    required this.snapshot,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: -20,
      right: -20,
      bottom: -20,
      top: -20,
      child: ImageFiltered(
        imageFilter: ImageFilter.blur(
          tileMode: TileMode.decal,
          sigmaY: 40,
          sigmaX: 40,
        ),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: snapshot.data![index].thumbnail == ''
                  ? AssetImage('images/emptybookcover.png') as ImageProvider
                  : NetworkImage(
                      snapshot.data![index].thumbnail,
                    ),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}

class BookCoverWidget extends StatelessWidget {
  final AsyncSnapshot<List<Book>> snapshot;
  final int index;

  const BookCoverWidget({
    required this.snapshot,
    required this.index,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 50,
      right: 50,
      bottom: 0,
      top: 20,
      child: Container(
        decoration: BoxDecoration(
          // border: Border.all(),
          borderRadius: BorderRadius.vertical(top: Radius.circular(4)),
          image: DecorationImage(
            image: snapshot.data![index].thumbnail == ''
                ? AssetImage('images/emptybookcover.png') as ImageProvider
                : NetworkImage(
                    snapshot.data![index].thumbnail,
                  ),
            fit: BoxFit.contain,
          ),
        ),
      ),
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
      margin: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      height: 180,
      color: Colors.transparent,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '꾸꾸까까님,',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black38,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    '독서가 습관이 되는 시작, 나만의 독서 목표를 세워보세요.',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black38,
                    ),
                  ),
                ),
                Icon(
                  Icons.navigate_next,
                ),
              ],
            ),
          ),
        ],
      ),
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
    return CarouselSlider.builder(
      options: CarouselOptions(
          viewportFraction: 1,
          height: 350.0,
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
            Container(
              color: Colors.primaries[currentPage].withOpacity(0.5),
              height: 270,
            ),
            Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: symmetricPadding,right: symmetricPadding,top: 80,),
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
                        style: TextStyle(color: Colors.black38, fontSize: 20),
                      ),
                      Container(
                        // margin: EdgeInsets.only(
                        //   left: 8,
                        //   bottom: 30,
                        // ),
                        padding: EdgeInsets.only(left: 8),
                        width: 80,
                        height: 40,
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${currentPage + 1}/${dataList.length}',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            Icon(Icons.navigate_next),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              right: 0,
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
        );
      },
    );
  }
}
