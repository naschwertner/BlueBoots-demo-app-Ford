import 'package:flutter/material.dart';
import 'minhas_tags.dart';
import 'adicionar_tags.dart';
import 'configurar_fordpass.dart';
import 'opcoes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Minha Página Inicial',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HOME'),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(height: 20),
          Center(
            child: Text('Blue Boots',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          ),
          SizedBox(height: 10),
          Center(
            child: Image.asset('images/fordtela1.PNG', width: 300, height: 300),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MinhasTagsPage()),
                    );
                  },
                  child: Text('MINHAS TAGS')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AdicionarTagsPage()),
                    );
                  },
                  child: Text('ADICIONAR TAGS')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ConfigurarFordPassPage()),
                    );
                  },
                  child: Text('CONFIGURAR FORD PASS')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => OpcoesPage()),
                    );
                  },
                  child: Text('OPÇÕES')),
            ],
          )
        ],
      ),
    );
  }
}
