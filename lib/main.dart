import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(color: Colors.orange,),
            MyAppBar(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.today),
              label: '투데이',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_box_outlined),
              label: '완독자수',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.manage_search_outlined),
              label: '검색',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.inventory_2_outlined),
              label: '내서재',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: '관리',
            ),
          ],
        ),
      ),
    );
  }
}

class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  const MyAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // leading: Text('Millie',style: TextStyle(fontSize: 20),),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
              child: Text('Millie',style: TextStyle(fontSize: 25),),
              onTap: () {
                print("clicked");
              },
            ),
          ),

          GestureDetector(
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
          )
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => throw UnimplementedError();
}
