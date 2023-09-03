import 'package:flutter/material.dart';

class RenomearTagPage extends StatefulWidget {
  @override
  _RenomearTagPageState createState() => _RenomearTagPageState();
}

class _RenomearTagPageState extends State<RenomearTagPage> {
  TextEditingController _controller =
      TextEditingController(); // Controlador para o TextField

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Renomear sua TAG'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'RENOMEAR TAG FURADEIRA',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Image.asset('images/nomear_tag.PNG', width: 400, height: 200),
            SizedBox(height: 20),
            Text(
              'Digite como deseja renomear sua TAG',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ), // Novo parágrafo de texto inserido
            SizedBox(height: 20),
            Container(
              width: 250.0,
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                color: Colors.white,
                border: Border.all(color: Colors.grey, width: 1),
              ),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: "Novo apelido de sua TAG",
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(height: 70),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('VOLTAR'),
                ),
                SizedBox(width: 15),
                ElevatedButton(
                  onPressed: () {
                    // Substitua a próxima linha pela navegação correta
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => NextPage()));
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
