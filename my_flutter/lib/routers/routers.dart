import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter/routers/router_handle.dart';

class Routers {
  static String root = '/';
  static String foodlistPage = '/foodlistpage';
  static String foodDetailPage = '/foodDetailpage';

  static FluroRouter router;

  static void configureHandle(FluroRouter router) {
    router.notFoundHandler = Handler(
      handlerFunc: (context, parameters) => Container(
        child: Center(
          child: Text('没有找到路由'),
        ),
      ),
    );
    router.define(foodDetailPage, handler: foodDetailPageHandle);
    router.define(foodlistPage, handler: foodlistPageHandle);
  }
}
