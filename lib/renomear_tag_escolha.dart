import 'package:flutter/material.dart';
import 'reiniciar_modulo_ble.dart';
import 'renomear_tag.dart';
import 'apagar_tag.dart';

class RenomearTagEscolhaPage extends StatefulWidget {
  @override
  _OpcoesPageState createState() => _OpcoesPageState();
}

class _OpcoesPageState extends State<RenomearTagEscolhaPage> {
  int? selectedButton;

  final List<String> buttonNames = [
    'TAG Macaco',
    'TAG Furadeira',
    'TAG Parafusadeira',
    'TAG Fenda',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Renomear TAG'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Text(
              'RENOMEAR TAG',
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
                        EdgeInsets.symmetric(vertical: 35)),
                  ),
                  onPressed: () {
                    setState(() {
                      selectedButton = index;
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
                    if (selectedButton != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RenomearTagPage(
                            tagName: buttonNames[selectedButton!],
                          ),
                        ),
                      );
                    } else {
                      // Você pode exibir uma mensagem pedindo para selecionar uma TAG primeiro.
                    }
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
