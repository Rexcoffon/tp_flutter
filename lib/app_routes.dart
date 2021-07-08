import 'package:flutter/material.dart';
import 'package:tp_flutter/screens/home_screen.dart';

const kMainRoute = '/';

final Map<String, WidgetBuilder> kRoutes = {
  kMainRoute: (_) => HomeScreen(),
};
