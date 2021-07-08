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

  backToHistory(context, bool result) {
    Navigator.of(context).pop(result);
  }

  changeButton() {
    setState(() {
      isChecked = !isChecked;
    });
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
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      /*Hero(
                          tag: 'my_image',
                          child: Image.asset('assets/images/logo.png')),*/
                      Text(widget.data.title),
                      Text(widget.data.date.toString()),
                      Text(widget.data.text.toString()),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
