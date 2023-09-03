import 'package:flutter/material.dart';

class ApagarTagPage extends StatefulWidget {
  @override
  _ApagarTagPageState createState() => _ApagarTagPageState();
}

class _ApagarTagPageState extends State<ApagarTagPage> {
  TextEditingController _controller =
      TextEditingController(); // Controlador para o TextField

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Apagar TAG'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'APAGAR TAG',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Image.asset('images/nomear_tag.PNG',
                width: 400,
                height:
                    200), // Se você tiver uma imagem específica para "Apagar TAG", substitua o caminho do arquivo aqui
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
                  hintText: "Apelido da TAG que deseja apagar",
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
                    // Adicione a lógica do botão CONTINUAR aqui
                    // Por exemplo, você pode querer mostrar um diálogo de confirmação antes de apagar a TAG
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
