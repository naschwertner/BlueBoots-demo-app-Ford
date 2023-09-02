import 'package:flutter/material.dart';

class ReiniciarModuloBLEPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reiniciar módulo BLE'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'REINICIAR MÓDULO BLE',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Image.asset('images/bluethoot.PNG', width: 400, height: 200),
            SizedBox(height: 20),
            Text(
              'Clique em confirmar para reuniair o módulo BLE, essa ação demora até 5 minutos.',
              textAlign: TextAlign.center,
            ),
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
                    // Ação do botão 2
                  },
                  child: Text('CONFIRMAR'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
