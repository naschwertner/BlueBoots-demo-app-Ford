import 'package:flutter/material.dart';
import 'reiniciar_modulo_ble.dart';
import 'renomear_tag.dart'; // Importe sua tela aqui
import 'apagar_tag.dart'; // Importe sua tela aqui

class OpcoesPage extends StatefulWidget {
  @override
  _OpcoesPageState createState() => _OpcoesPageState();
}

class _OpcoesPageState extends State<OpcoesPage> {
  int? selectedButton;

  final List<String> buttonNames = [
    'Renomear TAG',
    'Apagar TAG',
    'Reiniciar módulo BLE',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Opções'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Text(
              'OPÇÕES',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.separated(
                itemCount: buttonNames.length,
                separatorBuilder: (context, index) => SizedBox(height: 10),
                itemBuilder: (context, index) => ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        if (selectedButton == index)
                          return Color.fromARGB(255, 255, 176, 73);
                        return const Color.fromARGB(255, 230, 230, 230);
                      },
                    ),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.black),
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                        EdgeInsets.symmetric(vertical: 45)),
                  ),
                  onPressed: () {
                    setState(() {
                      selectedButton = index;
                      switch (buttonNames[index]) {
                        case 'Reiniciar módulo BLE':
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ReiniciarModuloBLEPage()),
                          );
                          break;
                        case 'Renomear TAG':
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    RenomearTagPage()), // Substitua com o nome correto da sua classe da tela
                          );
                          break;
                        case 'Apagar TAG':
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ApagarTagPage()), // Substitua com o nome correto da sua classe da tela
                          );
                          break;
                      }
                    });
                  },
                  child: Text(buttonNames[index]),
                ),
              ),
            ),
            SizedBox(height: 20),
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
