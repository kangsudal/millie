import 'package:flutter/material.dart';

class TodayScreen extends StatefulWidget {
  const TodayScreen({Key? key}) : super(key: key);

  @override
  State<TodayScreen> createState() => _TodayScreenState();
}

class _TodayScreenState extends State<TodayScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,
      appBar: TodayAppBar(),
      body: SingleChildScrollView(
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
                  size: 40,
                ),
                Positioned(
                  child: SizedBox(
                    child: CircleAvatar(
                      backgroundColor: Colors.orange,
                      child: Text(
                        'N',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    height: 20,
                    width: 20,
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
      // bottom: TabBar(tabs: [Tab(icon: Icon(Icons.cloud_outlined),),Tab(icon: Icon(Icons.cloud_outlined),),Tab(icon: Icon(Icons.cloud_outlined),),]),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
