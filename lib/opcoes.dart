import 'package:flutter/material.dart';

class OpcoesPage extends StatefulWidget {
  @override
  _OpcoesPageState createState() => _OpcoesPageState();
}

class _OpcoesPageState extends State<OpcoesPage> {
  int? selectedButton; // Para rastrear qual botão foi selecionado

  // Lista de nomes para os botões
  final List<String> buttonNames = [
    'Renomear TAG',
    'Apagar TAG',
    'Reiniciar módulo BLE',
    'Descpnectar FordPass'
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
            SizedBox(height: 20), // Espaço adicionado após o "OPÇÕES"
            Expanded(
              child: ListView.separated(
                itemCount: buttonNames.length,
                separatorBuilder: (context, index) =>
                    SizedBox(height: 10), // Aumentando o espaço entre os botões
                itemBuilder: (context, index) => ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        if (selectedButton == index)
                          return Color.fromARGB(
                              255, 255, 176, 73); // Se selecionado
                        return const Color.fromARGB(
                            255, 230, 230, 230); // Senão
                      },
                    ),
                    foregroundColor: MaterialStateProperty.all<Color>(
                        Colors.black), // Cor da letra
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                        EdgeInsets.symmetric(
                            vertical: 30)), // Tornando os botões mais largos
                  ),
                  onPressed: () {
                    setState(() {
                      selectedButton =
                          index; // Altera o botão selecionado ao pressionar
                    });
                  },
                  child: Text(buttonNames[
                      index]), // Usando o nome da lista de nomes para os botões
                ),
              ),
            ),
            SizedBox(height: 20), // Espaço antes dos botões inferiores
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
