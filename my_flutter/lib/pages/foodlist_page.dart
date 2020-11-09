import 'dart:async';

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter/Models/SearchResult.dart';
import 'package:my_flutter/request/baseRequest.dart';
import 'package:my_flutter/routers/application.dart';
import 'package:my_flutter/routers/routers.dart';

class FoodListPage extends StatefulWidget {
  final String classId;
  FoodListPage({this.classId});

  @override
  _FoodListPageState createState() => _FoodListPageState();
}

class _FoodListPageState extends State<FoodListPage> {
  int _countPage = 20;
  @override
  void initState() {
    super.initState();
  }

  Future<List<ResultList>> _fetchFoodList(
      String classId, String currentPage) async {
    List<ResultList> resultList;
    await HttpRequest.requestForCustorm(
            "byclass?classid=$classId&start=$currentPage&num=$_countPage&appkey=65713cdd1752834be1dcf390337f3d9e")
        .then((res) async {
      print(res.toString());
      if (res["result"]["status"] == 0) {
        resultList = SearchList.fromJson(res["result"]["result"]).list;
      }
    });

    return resultList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("菜谱列表"),
      ),
      body: FutureBuilder<List<ResultList>>(
          future: _fetchFoodList("${widget.classId}", "0"),
          initialData: null,
          builder:
              (BuildContext context, AsyncSnapshot<List<ResultList>> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return Center(
                  child: Text('暂无数据'),
                );
                break;
              case ConnectionState.waiting:
                return Center(
                  child: Text('正在加载...'),
                );
                break;
              case ConnectionState.done:
                return snapshot.data != null
                    ? Container(
                        child: ListView.builder(
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Application.router.navigateTo(
                                      context, Routers.foodDetailPage,
                                      transition: TransitionType.material,
                                      routeSettings: RouteSettings(
                                          name: "detailModel",
                                          arguments: snapshot.data[index]));
                                },
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Image.network(
                                        "${snapshot.data[index].pic}",
                                        height: 90,
                                        width: 90,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${snapshot.data[index].name}",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                                "适合: ${snapshot.data[index].peoplenum}"),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "${snapshot.data[index].tag}",
                                              style: TextStyle(wordSpacing: 2),
                                              maxLines: 2,
                                              softWrap: true,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }),
                      )
                    : Container(
                        child: Center(
                          child: Text('暂无信息'),
                        ),
                      );
                break;
              case ConnectionState.none:
                return Center(
                  child: Text('暂无数据'),
                );
                break;
              default:
                return Center(
                  child: Text('暂无数据'),
                );
            }
          }),
    );
  }

  @override
  void dispose() {
    // _classidSubject.close();
    super.dispose();
  }
}
