import 'package:flutter/material.dart';
import 'package:millie/screens/0_today/tab_widdget/tab_audiochatbook.dart';
import 'package:millie/screens/0_today/tab_widdget/tab_now.dart';
import 'package:millie/screens/0_today/tab_widdget/tab_story.dart';

class TodayScreen extends StatefulWidget {
  const TodayScreen({Key? key}) : super(key: key);

  @override
  State<TodayScreen> createState() => _TodayScreenState();
}

class _TodayScreenState extends State<TodayScreen> {
  @override
  Widget build(BuildContext context) {
    List<Widget> _widgetOptions = [
      NowTabBarView(),
      AudioBookTabBarView(),
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
        GestureDetector(
          onTap: () {
            print('clicked');
            Navigator.pushNamed(context, '/notification');
          },
          child: Padding(
            padding: const EdgeInsets.only(top: 5.0, right: 8),
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
