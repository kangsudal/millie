import 'package:flutter/material.dart';
import 'package:millie/screens/0_today/today.dart';

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

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = [
    TodayScreen(),
    Container(color: Colors.amber,),
    Container(color: Colors.deepPurple,),
    Container(color: Colors.yellow,),
    Container(color: Colors.blueGrey,),
  ];

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(child: _widgetOptions[_selectedIndex],),
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
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}


