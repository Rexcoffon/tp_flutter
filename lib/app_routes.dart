import 'package:flutter/material.dart';
import 'package:tp_flutter/modules/model/homeTile_model.dart';
import 'package:tp_flutter/screens/home/home_screen.dart';
import 'package:tp_flutter/screens/note_details/note_details_sreen.dart';

const kMainRoute = '/';
const kNoteDetailsRoute = '/note-details';

final Map<String, WidgetBuilder> kRoutes = {
  kMainRoute: (_) => HomeScreen(),
};

onGenerateRoute(settings) {
  if (settings.name == kNoteDetailsRoute) {
    HomeTileModel data = settings.arguments;
    return MaterialPageRoute(builder: (_) => NoteDetailsScreen(data: data));
  } else {
    return null;
  }
}
