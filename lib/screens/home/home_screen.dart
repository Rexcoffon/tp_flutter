import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:tp_flutter/app_routes.dart';
import 'package:tp_flutter/modules/model/homeTile_model.dart';
import 'package:tp_flutter/screens/home/dialog/camera_dialog.dart';
import 'package:tp_flutter/screens/home/widgets/tile_home.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final tileElements = [
    HomeTileModel(
        title: 'La note de Toto',
        date: DateTime.now(),
        text:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
        imagePath: ''),
  ];

  navigateToDetails(
      {required HomeTileModel arguments, required int position}) async {
    bool? resultat = await Navigator.pushNamed(context, kNoteDetailsRoute,
        arguments: arguments) as bool?;

    if (resultat != null) {
      setState(() {
        tileElements[position].isChecked = resultat;
      });
    }
  }

  Future _showMyDialog() async {
    XFile? res = await showDialog(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return Dialog(
          elevation: 0,
          backgroundColor: Colors.transparent,
          shape: CircleBorder(),
          child: CameraDialog(),
        );
      },
    );
    if (res != null) {
      print(res);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'MES NOTES',
                textAlign: TextAlign.left,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              Padding(padding: const EdgeInsets.all(10)),
              Container(
                padding: EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                  ),
                ),
                child: Column(children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'NOUVELLE NOTES',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Titre',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.zero),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.multiline,
                    maxLines: 6,
                    decoration: const InputDecoration(
                      labelText: 'Contenu',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.zero),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 10),
                    alignment: Alignment.centerLeft,
                    child: InkWell(
                      borderRadius: BorderRadius.zero,
                      onTap: () {
                        // use dialog pour la camera
                        //https://gitlab.bewizyu.com/learn/flutter/flutter_app/-/blob/feature/11-Dialog/lib/app/screens/history/history_screen.dart
                        _showMyDialog();
                      },
                      child: Ink(
                        height: 40,
                        width: 150,
                        child: Center(
                            child: Container(
                                child: Text('Ajouter une image',
                                    style: TextStyle(color: Colors.white)))),
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.zero),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 10),
                    child: InkWell(
                      borderRadius: BorderRadius.zero,
                      onTap: () {},
                      child: Ink(
                        height: 40,
                        width: double.infinity,
                        child: Center(
                            child: Container(
                                child: Text('Ajouter ma note',
                                    style: TextStyle(color: Colors.white)))),
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.zero),
                      ),
                    ),
                  ),
                ]),
              ),
              Padding(
                padding: EdgeInsets.all(15.0),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'MES NOTES SAUVEGARDEES',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  /*ListView.separated(
                    itemCount: tileElements.length,
                    itemBuilder: (context, position) {
                      return InkWell(
                        //onTap: () => navigateToDetailsScreen(
                        //  context, e.result.toString(), e.date.toString()),
                        child: TileHome(
                          element: tileElements[position],
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int position) {
                      return Container();
                    },
                  )*/
                  InkWell(
                    onTap: () => navigateToDetails(
                        arguments: tileElements[0], position: 0),
                    child: TileHome(
                      element: tileElements[0],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
