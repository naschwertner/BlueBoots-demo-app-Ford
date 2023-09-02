import 'package:flutter/material.dart';

class NomearSuaNovaTagPage extends StatefulWidget {
  @override
  _NomearSuaNovaTagPageState createState() => _NomearSuaNovaTagPageState();
}

class _NomearSuaNovaTagPageState extends State<NomearSuaNovaTagPage> {
  TextEditingController _controller =
      TextEditingController(); // Controlador para o TextField

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nomear sua nova TAG'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'NOMEAR SUA NOVA TAG',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Image.asset('images/nomear_tag.PNG', width: 400, height: 200),
            SizedBox(height: 20),
            Container(
              width: 250.0, // Diminuir a largura do container
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                color: Colors.white,
                border: Border.all(color: Colors.grey, width: 1),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Apelido de sua TAG",
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('VOLTAR'),
                ),
                SizedBox(
                    width: 15), // Ajuste o valor de width conforme necessário
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NomearSuaNovaTagPage()),
                    );
                  },
                  child: Text('CONTINUAR'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
