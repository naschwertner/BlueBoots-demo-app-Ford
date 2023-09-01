import 'package:flutter/material.dart';

class ConfigurarFordPassPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configurar FordPass'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'CONFIGURAR FORD PASS',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              'Digite o código que aparece em seu app FordPass, escaneie o QR code a seguir para abrir o app.',
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Image.asset('images/fordpass.PNG',
                    width: 180,
                    height:
                        180), // Ajuste o tamanho da imagem conforme necessário
                Image.asset('images/qrcode.PNG',
                    width: 180,
                    height:
                        180), // Ajuste o tamanho da imagem conforme necessário
              ],
            ),
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
                decoration: InputDecoration(
                  hintText: "Código",
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    // Ação do botão 1
                  },
                  child: Text('VOLTAR'),
                ),
                SizedBox(width: 15),
                ElevatedButton(
                  onPressed: () {
                    // Ação do botão 2
                  },
                  child: Text('ADICIONAR'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
