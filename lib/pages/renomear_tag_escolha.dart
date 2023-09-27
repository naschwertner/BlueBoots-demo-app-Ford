import 'package:flutter/material.dart';
import 'reiniciar_modulo_ble.dart';
import 'renomear_tag.dart';
import 'apagar_tag.dart';
import '/models/tag.dart'; // Certifique-se de substituir com o caminho correto para o seu modelo Tag
import '/repository/tag_repository.dart'; // Certifique-se de substituir com o caminho correto para o seu repositório Tag

class RenomearTagEscolhaPage extends StatefulWidget {
  @override
  _OpcoesPageState createState() => _OpcoesPageState();
}

class _OpcoesPageState extends State<RenomearTagEscolhaPage> {
  int? selectedButton;
  late Future<List<Tag>> futureTags;

  @override
  void initState() {
    super.initState();
    futureTags = TagRepository().listarTags();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Renomear TAG'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder<List<Tag>>(
          future: futureTags,
          builder: (context, snapshot) {
            return Column(
              children: <Widget>[
                Text(
                  'RENOMEAR TAG',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                if (snapshot.connectionState == ConnectionState.waiting)
                  Expanded(child: Center(child: CircularProgressIndicator()))
                else if (snapshot.hasError)
                  Expanded(child: Center(child: Text('Erro ao carregar tags.')))
                else if (!snapshot.hasData || snapshot.data!.isEmpty)
                  Expanded(
                      child: Center(child: Text('Nenhuma tag encontrada.')))
                else
                  Expanded(
                    child: ListView.separated(
                      itemCount: snapshot.data!.length,
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 10),
                      itemBuilder: (context, index) {
                        final tag = snapshot.data![index];
                        return ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                                if (selectedButton == index)
                                  return Color.fromARGB(255, 255, 176, 73);
                                return const Color.fromARGB(255, 230, 230, 230);
                              },
                            ),
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.black),
                            padding:
                                MaterialStateProperty.all<EdgeInsetsGeometry>(
                                    EdgeInsets.symmetric(vertical: 35)),
                          ),
                          onPressed: () {
                            setState(() {
                              selectedButton = index;
                            });
                          },
                          child: Text(tag.apelido),
                        );
                      },
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
                                tagName:
                                    snapshot.data![selectedButton!].apelido,
                              ),
                            ),
                          );
                        } else {
                          // Você pode exibir uma mensagem pedindo para selecionar uma TAG primeiro.
                          print('Selecione uma TAG primeiro');
                        }
                      },
                      child: Text('ADICIONAR'),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
