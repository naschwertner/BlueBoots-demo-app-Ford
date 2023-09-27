import 'package:flutter/material.dart';

class ApagarTagPage extends StatefulWidget {
  final String tagName; // Parâmetro para receber o nome da TAG

  ApagarTagPage({required this.tagName});

  @override
  _ApagarTagPageState createState() => _ApagarTagPageState();
}

class _ApagarTagPageState extends State<ApagarTagPage> {
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
              'APAGAR ${widget.tagName}',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Image.asset('images/nomear_tag.PNG',
                width: 400,
                height:
                    200), // Se você tiver uma imagem específica para "Apagar TAG", substitua o caminho do arquivo aqui
            SizedBox(height: 20),
            Text(
              'Ao clicar em "CONTINUAR", a ${widget.tagName} será permanentemente apagada e todas as informações relacionadas a ela serão perdidas.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.red),
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
                    _showConfirmationDialog(context);
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

  _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmar Exclusão'),
          content:
              Text('Você realmente deseja apagar a TAG ${widget.tagName}?'),
          actions: <Widget>[
            TextButton(
              child: Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop(); // Fecha o diálogo
              },
            ),
            TextButton(
              child: Text('Apagar'),
              onPressed: () {
                // Lógica para apagar a TAG
                Navigator.of(context).pop(); // Fecha o diálogo
                Navigator.of(context).pop(); // Retorna à tela anterior
              },
            ),
          ],
        );
      },
    );
  }
}
