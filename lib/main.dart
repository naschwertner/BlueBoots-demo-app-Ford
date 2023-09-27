import 'package:flutter/material.dart';
import 'pages/minhas_tags.dart';
import 'pages/adicionar_tags.dart';
import 'pages/opcoes.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://ahxuqqvbnnxmbdkmblwd.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImFoeHVxcXZibm54bWJka21ibHdkIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTU4MzczNzYsImV4cCI6MjAxMTQxMzM3Nn0.W8EbLKDfqwi6fWIFtSsJZ_uW_k2O7xZxXLnc3HVYA_w',
  );
  runApp(MyApp());
}

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
