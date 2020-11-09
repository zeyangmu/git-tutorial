import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter/Models/CategoryResult.dart';
import 'package:my_flutter/config/config.dart';
import 'package:my_flutter/request/HttpConfig.dart';
import 'package:my_flutter/request/baseRequest.dart';
import 'package:my_flutter/routers/application.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    fetchList();
  }

  var bar = SliverAppBar(
    pinned: true,
    primary: true,
    elevation: 10,
    leading: Icon(Icons.language),
    expandedHeight: 190,
    actions: [
      IconButton(
        icon: Icon(Icons.shopping_cart),
        tooltip: 'Open shopping cart',
        onPressed: () {
          // handle the press
        },
      ),
    ],
    flexibleSpace: FlexibleSpaceBar(
      title: const Text(
        '世界设计师',
        style: TextStyle(color: Colors.black12, shadows: [
          Shadow(color: Colors.blue, offset: Offset(1, 1), blurRadius: 2)
        ]),
      ),
    ),
    // backgroundColor: Colors.green,
  );

  void fetchList() {
    HttpRequest.requestForCustorm(categoryUrlStr, method: HttpConfig.methodGet)
        .then((res) {
      print(res);

      setState(() {
        _categoryList = CategoryResult.fromJson(res["result"]);
      });

      List lsi = _categoryList.result.map((item) {
        print(item.classid);
        return item.name;
      }).toList();

      print(lsi);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("首页"),
      ),
      body: _showGridView(),
    );
  }

  CategoryResult _categoryList;

  Widget _showGridView() {
    if (_categoryList != null && _categoryList.result.length > 0) {
      return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          crossAxisCount: 3,
        ),
        padding: EdgeInsets.all(10),
        itemCount: _categoryList.result.length,
        itemBuilder: (context, index) {
          BigCategoryItem item = _categoryList.result[index];
          return GestureDetector(
            onTap: () {
              Application.router.navigateTo(
                  context, "/foodlistpage?classId=${item.classid}",
                  transition: TransitionType.material);
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(4),
                  ),
                  color: Colors.grey[200]),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      image: AssetImage(
                        'images/${item.imageName}.png',
                      ),
                      height: 80,
                      width: 80,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text("${item.name}"),
                  ],
                ),
              ),
            ),
          );
        },
      );
    } else {
      return Container(
        child: Center(
          child: Text("暂无数据"),
        ),
      );
    }
  }
}
