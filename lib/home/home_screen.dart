import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
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
                  },
                  child: Ink(
                    height: 40,
                    width: 150,
                    child: Center(
                        child: Container(
                            child: Text('Ajouter une image',
                                style: TextStyle(color: Colors.white)))),
                    decoration: BoxDecoration(
                        color: Colors.grey, borderRadius: BorderRadius.zero),
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
                        color: Colors.grey, borderRadius: BorderRadius.zero),
                  ),
                ),
              ),
            ]),
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
          ),
          Column(
            children: [
              Text(
                'MES NOTES SAUVEGARDEES',
                textAlign: TextAlign.left,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
            ],
          )
        ],
      ),
    ));
  }
}
