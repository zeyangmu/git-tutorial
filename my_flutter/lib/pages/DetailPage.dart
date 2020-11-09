import 'package:flutter/material.dart';
import 'package:my_flutter/Models/SearchResult.dart';
import 'package:my_flutter/request/baseRequest.dart';

class DetailPage extends StatefulWidget {
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  ScrollController _scrollController;
  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController();
    fetchDetail();
  }

  void fetchDetail() {
    HttpRequest.requestForCustorm("").then((res) {});
  }

  @override
  Widget build(BuildContext context) {
    ResultList resultList = ModalRoute.of(context).settings.arguments;

    var appBar = SliverAppBar(
      pinned: true,
      snap: true,
      floating: true,
      expandedHeight: 200,
      title: Text('${resultList.name}'),
      flexibleSpace: FlexibleSpaceBar(
        background: Image.network(
          "${resultList.pic}",
          fit: BoxFit.cover,
        ),
      ),
    );

    var header = SliverPersistentHeader(
      delegate: _SliverAppBarDelegate(
          minHeight: 60,
          maxHeight: 180,
          child: Container(
            padding: EdgeInsets.all(10),
            width: double.infinity,
            color: Colors.white,
            child: Column(children: [
              Expanded(
                child: Text(
                  '适合 ${resultList.peoplenum} 准备用时${resultList.preparetime} 做餐用时${resultList.cookingtime}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Expanded(
                child: Text(
                  '美食介绍 : ${resultList.content}',
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                ),
                flex: 1,
              ),
            ]),
          )),
    );

    var list = SliverList(
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        return Container(
          padding: EdgeInsets.all(10),
          color: Colors.white,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.network(
                "${resultList.process[index].pic}",
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                  child: RichText(
                text: TextSpan(
                    text: "第${index + 1}步 ",
                    children: [
                      TextSpan(
                          text: "${resultList.process[index].pcontent}",
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 16,
                              color: Colors.black54)),
                    ],
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.black)),
              )),
            ],
          ),
        );
      }, childCount: resultList.process.length),
    );

    return Scaffold(
      body: Container(
        height: double.infinity,
        color: Colors.white,
        child: CustomScrollView(
          slivers: [appBar, header, list],
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;
  _SliverAppBarDelegate(
      {@required this.minHeight,
      @required this.maxHeight,
      @required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(
      child: child,
    );
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(covariant _SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
