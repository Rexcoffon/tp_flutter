import 'package:flutter/material.dart';
import 'package:tp_flutter/modules/model/homeTile_model.dart';

class TileHome extends StatelessWidget {
  const TileHome({
    required this.element,
  });

  final HomeTileModel element;

  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            element.title,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
          ),
          Text(
            element.date.toString(),
            style: TextStyle(color: Colors.black.withOpacity(0.5)),
          ),
          Padding(padding: EdgeInsets.only(bottom: 20)),
          Text(
            element.text,
          )
        ],
      ),
      padding: EdgeInsets.only(bottom: 20, top: 20),
    );
  }
}
