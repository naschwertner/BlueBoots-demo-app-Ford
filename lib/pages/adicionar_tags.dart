import 'package:flutter/material.dart';
import 'nomear_sua_nova_tag.dart';
import '../models/tag.dart';
import '../repository/tag_repository.dart';

class AdicionarTagsPage extends StatefulWidget {
  @override
  _AdicionarTagsPageState createState() => _AdicionarTagsPageState();
}

class _AdicionarTagsPageState extends State<AdicionarTagsPage> {
  final _codigoController = TextEditingController();
  final _tagRepository = TagRepository();

  @override
  void dispose() {
    _codigoController.dispose();
    super.dispose();
  }

  Future<void> _adicionarTagECarregarProximaPagina() async {
    if (_codigoController.text.isNotEmpty) {
      var novaTag = Tag(
        id: 0,
        codigo: _codigoController.text,
        apelido: 'Nome temporário',
        presente: true,
      );

      var tagAdicionada = await _tagRepository.adicionarTag(novaTag);

      if (tagAdicionada != null) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => NomearSuaNovaTagPage()),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Tags'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                // Botão de teste para navegar diretamente para NomearSuaNovaTagPage
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NomearSuaNovaTagPage()),
                );
              },
              child: Text('TESTE NAVEGAÇÃO'),
            ),
            Text(
              'ADICIONAR NOVA TAG',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Image.asset('images/addtagkey.PNG', width: 400, height: 200),
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
                controller: _codigoController,
                decoration: InputDecoration(
                  hintText: "Código da TAG",
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
                SizedBox(width: 15),
                ElevatedButton(
                  onPressed: () async {
                    await _adicionarTagECarregarProximaPagina();
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
