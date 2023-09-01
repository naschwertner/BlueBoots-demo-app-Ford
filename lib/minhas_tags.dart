import 'package:flutter/material.dart';

class MinhasTagsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Minhas Tags'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'MINHAS TAGS',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Image.asset('images/minhastags.PNG', width: 400, height: 200),
            SizedBox(height: 20),
            Text(
              'ATENÇÃO: Tag parafusadeira não se encontra no veículo',
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    // Ação do botão 1
                  },
                  child: Text('VOLTAR'),
                ),
                SizedBox(
                    width: 15), // Ajuste o valor de width conforme necessário
                ElevatedButton(
                  onPressed: () {
                    // Ação do botão 2
                  },
                  child: Text('LOCALIZAR'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
