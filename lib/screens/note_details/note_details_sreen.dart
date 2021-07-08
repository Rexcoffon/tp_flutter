import 'package:flutter/material.dart';
import 'package:tp_flutter/modules/model/homeTile_model.dart';

class NoteDetailsScreen extends StatefulWidget {
  const NoteDetailsScreen({required this.data});
  final HomeTileModel data;

  //dans un stateless on ne change pas d'état
  @override
  _NoteDetailsScreenState createState() => _NoteDetailsScreenState();
}

class _NoteDetailsScreenState extends State<NoteDetailsScreen> {
  bool isChecked = false;

  @override
  void initState() {
    isChecked = widget.data.isChecked;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pop(isChecked);
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          leading: BackButton(
            color: Colors.black,
          ),
          elevation: 0,
          title: Text(
            'MA NOTE',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.data.title,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
                  ),
                  Text(
                    widget.data.date.toString(),
                    style: TextStyle(color: Colors.black.withOpacity(0.5)),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 30)),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Text(
                      widget.data.text,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  /*Hero(
                      tag: 'my_image',
                      child: Image.asset('assets/images/logo.png')),*/
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
