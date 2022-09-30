import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  const MyAppBar({
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
        ),
      ],
      elevation: 0,
      backgroundColor: Colors.transparent,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class ContainerAppBar extends StatelessWidget {
  const ContainerAppBar({
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
              child: Text(
                'Millie',
                style: TextStyle(fontSize: 25),
              ),
              onTap: () {
                print("clicked");
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(right: 8.0),
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
      ),
    );
  }
}
