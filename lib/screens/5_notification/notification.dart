import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  int itemCount = 10;
  late List<bool> _isVisible = List.generate(itemCount, (index) => true);

  @override
  Widget build(BuildContext context) {
    List<Widget> _widgetOptions = [
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.notifications_none),
            Text('도착한 알림메세지가 없습니다.'),
          ],
        ),
      ),
      ListView.builder(
        itemBuilder: (context, index) {
          return Column(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    _isVisible[index] = !_isVisible[index];
                  });
                },
                child: ListTile(
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        child: Text(
                          "N",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        radius: 10,
                        backgroundColor: Colors.yellow,
                        foregroundColor: Colors.black,
                      ),
                      Text('[업데이트]오디오 플레이어 및 서비스 업데이트 안내'),
                    ],
                  ),
                  trailing: Icon(Icons.keyboard_arrow_down),
                  subtitle: Text('2022-10-06'),
                ),
              ),
              Visibility(
                visible: _isVisible[index],
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: SelectableText.rich(
                    TextSpan(
                      text: '안녕하세요. 독서와 무제한 친해지리, 밀리의 서재입니다.\n',
                      children: [
                        TextSpan(
                          text: '1. 오디오 플레이어 추가\n',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                            text:
                                '평범하지만 따뜻한 이야기 <어서오세요. 휴남동 서점입니다> 오디오 드라마가 오픈되었는데요. 이에 맞춰 오연서, 이수혁의 목소리를 더욱 편리하게 들어보실 수 있도록 오디오 플레이어가 추가되었습니다.\n'),
                        WidgetSpan(
                          child: SizedBox(
                              height: 220,
                              width: 150,
                              child: Image.asset(
                                'images/img_audiodrama.jpg',
                                fit: BoxFit.contain,
                              )),
                        ),
                        TextSpan(text: '\n최근 들은 오디오 메뉴를 통해 바로 이용하실 수 있어요.'),
                      ],
                    ),
                  ),
                  color: Colors.grey[300],
                  height: 400,
                  width: double.infinity,
                ),
              ),
            ],
          );
        },
        itemCount: itemCount,
      ),
    ];
    return DefaultTabController(
      length: _widgetOptions.length,
      child: SafeArea(
        child: Scaffold(
          appBar: NotificationAppBar(),
          body: TabBarView(children: _widgetOptions),
        ),
      ),
    );
  }
}

class NotificationAppBar extends StatelessWidget with PreferredSizeWidget {
  const NotificationAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(
        '알림센터',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      bottom: TabBar(
        tabs: [
          Tab(text: '알림'),
          Tab(text: '공지사항'),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight * 2);
}
