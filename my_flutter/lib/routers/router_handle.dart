import 'package:fluro/fluro.dart';
import 'package:my_flutter/pages/DetailPage.dart';
import 'package:my_flutter/pages/foodlist_page.dart';

var foodlistPageHandle = Handler(handlerFunc: (context, parameters) {
  print("=====${parameters["classId"].first}");
  return FoodListPage(
    classId: parameters["classId"].first,
  );
});
var foodDetailPageHandle = Handler(handlerFunc: (context, parameters) {
  return DetailPage();
});
