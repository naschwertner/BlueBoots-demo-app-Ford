import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/tag.dart';

class TagRepository {
  // Método para listar as tags
  Future<List<Tag>> listarTags() async {
    final supabase = Supabase.instance;
    final res = await supabase.client.from('tags').select().execute();

    if (res.status != 200 || res.data == null) {
      print("Erro ao listar as tags");
      return [];
    }

    final List<Map<String, dynamic>> rows =
        res.data as List<Map<String, dynamic>>;
    final tags = rows
        .map((row) => Tag(
              id: row['id'],
              codigo: row['codigo'],
              apelido: row['apelido'],
              presente: row['presente'] == true,
            ))
        .toList();

    return tags;
  }

  // Método para adicionar uma tag
  Future<Tag?> adicionarTag(Tag tag) async {
    final supabase = Supabase.instance;
    final res = await supabase.client.from('tags').insert({
      'codigo': tag.codigo,
      'apelido': tag.apelido,
      'presente': tag.presente,
    }).execute();

    if (res.status != 201 || res.data == null) {
      // 201 é o status para criação bem-sucedida
      print("Erro ao adicionar a tag");
      return null;
    }

    final Map<String, dynamic> data = (res.data as List).first;
    final createdTag = Tag(
      id: data['id'],
      codigo: data['codigo'],
      apelido: data['apelido'],
      presente: data['presente'] == true,
    );

    return createdTag;
  }

  // Método para atualizar uma tag
  Future<int> atualizarTag(Tag tag) async {
    final supabase = Supabase.instance;
    final res = await supabase.client
        .from('tags')
        .update({
          'codigo': tag.codigo,
          'apelido': tag.apelido,
          'presente': tag.presente,
        })
        .eq('id', tag.id)
        .execute();

    if (res.status != 200) {
      print("Erro ao atualizar a tag");
      return 0;
    }

    return res.count ?? 0; // Adicionado o operador de coalescência nula
  }

  // Método para excluir uma tag
  Future<int> excluirTag(int id) async {
    final supabase = Supabase.instance;
    final res =
        await supabase.client.from('tags').delete().eq('id', id).execute();

    if (res.status != 200) {
      print("Erro ao excluir a tag");
      return 0;
    }

    return res.count ?? 0; // Adicionado o operador de coalescência nula
  }
}
