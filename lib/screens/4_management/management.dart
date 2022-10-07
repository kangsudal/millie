import 'package:flutter/material.dart';
import 'package:millie/screens/0_today/tab_widdget/tab_now.dart';

class ManagementScreen extends StatelessWidget {
  const ManagementScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Widget1(),
          Widget2(),
          Widget3(),
        ],
      ),
    );
  }
}

class Widget1 extends StatelessWidget {
  const Widget1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 270,
      // decoration: BoxDecoration(color: Colors.blueGrey),
      child: Padding(
        padding: EdgeInsets.only(
          left: leftPadding,
          right: leftPadding,
          top: leftPadding,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 50,
              child: Row(
                children: [
                  ClipOval(
                    child: Container(
                      padding: EdgeInsets.all(3),
                      color: Colors.purple,
                      child: Icon(
                        Icons.phone_android,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Text(
                      '휴대폰 계정 회원',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black38,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 50,
              child: Text(
                '꾸꾸까까 님',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              height: 100,
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('정기구독을 시작하세요.'),
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.all(
                              Radius.circular(30),
                            ),
                          ),
                          child: Text('구독 관리 >'),
                        ),
                      ]),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text('어려운 독서, 시작하면 습관이 됩니다.')),
                ],
              ),
            ),
            Container(
              height: 40,
              width: double.infinity,
              margin: EdgeInsets.symmetric(vertical: 5),
              // padding: EdgeInsets.all(10),
              // height: 50,
              decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              child: Center(child: Text('무료로 구독 시작하기')),
            ),
            // Center(
            //   child: Container(
            //     decoration: BoxDecoration(color: Colors.yellow),
            //     child: Text(
            //       '무료로 구독 시작하기',
            //       style: TextStyle(
            //         fontWeight: FontWeight.bold,
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

class Widget2 extends StatelessWidget {
  const Widget2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      // decoration: BoxDecoration(color: Colors.blueGrey),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(
              left: leftPadding,
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text('서비스 안내'),
            ),
            // width: double.infinity,
            height: 30,
            decoration: BoxDecoration(
              color: Colors.black12,
            ),
          ),
          MyTile('공지사항'),
          MyTile('약관 및 정책/이용 동의'),
          MyTile('고객센터'),
          MyTile('버전정보 4.14.0.0'),
          MyTile('오픈소스 라이선스'),
        ],
      ),
    );
  }
}

class MyTile extends StatelessWidget {
  final String title;
  const MyTile(
    this.title, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: leftPadding,
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text('$title'),
      ),
      // width: double.infinity,
      height: 30,
      decoration: BoxDecoration(
        // color: Colors.black12,
        border: Border(bottom: BorderSide(color: Colors.black12)),
      ),
    );
  }
}

class Widget3 extends StatelessWidget {
  const Widget3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      decoration: BoxDecoration(color: Colors.black12),
      child: Container(
        alignment: Alignment.topCenter,
        width: double.infinity,
        height: 50,
        margin: EdgeInsets.only(left: 20,right:20, top: 10,bottom: 130),
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
            child: Text(
          '로그아웃',
          style: TextStyle(
            color: Colors.white,
          ),
        )),
      ),
    );
  }
}
