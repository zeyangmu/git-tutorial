import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter/pages/FavorPage.dart';
import 'package:my_flutter/pages/HomePage.dart';
import 'package:my_flutter/pages/MorePage.dart';
import 'package:my_flutter/routers/application.dart';
import 'package:my_flutter/routers/routers.dart';

main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentSelect = 0;
  @override
  Widget build(BuildContext context) {
    Application.router = FluroRouter();
    Routers.configureHandle(Application.router);
    Routers.router = Application.router;

    return MaterialApp(
      // initialRoute: "/",
      onGenerateRoute: Application.router.generator,
      theme: ThemeData(
        primaryColor: Colors.green,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentSelect,
          onTap: (index) {
            setState(() {
              _currentSelect = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: "首页",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.dvr,
              ),
              label: "分类",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.more_horiz,
              ),
              label: "更多",
            )
          ],
        ),

        body: IndexedStack(
          index: _currentSelect,
          children: [
            HomePage(),
            FavorPage(),
            MorePage(),
          ],
        ),

        // body: HomePage(),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {},
        ),
      ),
    );
  }
}
