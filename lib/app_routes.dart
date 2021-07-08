import 'package:flutter/material.dart';
import 'package:tp_flutter/home/home_screen.dart';

const kMainRoute = '/';

final Map<String, WidgetBuilder> kRoutes = {
  kMainRoute: (_) => HomeScreen(),
};
