import 'package:flutter/material.dart';

class TodayScreen extends StatefulWidget {
  const TodayScreen({Key? key}) : super(key: key);

  @override
  State<TodayScreen> createState() => _TodayScreenState();
}

class _TodayScreenState extends State<TodayScreen> {
  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 0;
    List<Widget> _widgetOptions = [
      SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              color: Colors.pink,
            ),
            Container(
              height: 300,
              color: Colors.yellow,
            ),
            Container(
              height: 300,
              color: Colors.pink,
            ),
          ],
        ),
      ),
      SingleChildScrollView(
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
      ),
      SingleChildScrollView(
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
      ),
    ];
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        // extendBodyBehindAppBar: true,
        appBar: TodayAppBar(),
        body: TabBarView(
          children: _widgetOptions,
        ),
      ),
    );
  }
}

class TodayAppBar extends StatelessWidget with PreferredSizeWidget {
  const TodayAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // leading: Text('Millie',style: TextStyle(fontSize: 20),),
      title: GestureDetector(
        child: Text('Millie'),
        onTap: () {
          print("clicked");
        },
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(top: 5.0, right: 8),
          child: GestureDetector(
            onTap: () {},
            child: Stack(
              children: [
                Icon(
                  Icons.notifications_none,
                  size: 35,
                ),
                Positioned(
                  child: SizedBox(
                    child: CircleAvatar(
                      backgroundColor: Colors.orange,
                      child: Text(
                        'N',
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      ),
                    ),
                    height: 15,
                    width: 15,
                  ),
                  top: 3,
                  right: 3,
                ),
              ],
            ),
          ),
        )
      ],
      elevation: 0,
      backgroundColor: Colors.transparent,
      bottom: const TabBar(
        tabs: <Widget>[
          Tab(
            child: Text('NOW'),
          ),
          Tab(
            child: Text('오디오북·챗북'),
          ),
          Tab(
            child: Text('스토리'),
          ),
        ],
        indicatorColor: Colors.black,
        indicatorWeight: 4,
        labelStyle: TextStyle(
          fontWeight: FontWeight.w900,
        ),
        unselectedLabelStyle: TextStyle(
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight * 2);
}
