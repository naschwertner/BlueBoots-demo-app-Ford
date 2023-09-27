import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/tag.dart';

class TagRepository {
  Future<List<Tag>> listarTags() async {
    final supabase = Supabase.instance;
    final rows =
        await supabase.client.from('tags').select<List<Map<String, dynamic>>>();

    final tags = rows
        .map((row) => Tag(
            id: row['id'],
            codigo: row['codigo'],
            apelido: row['apelido'],
            presente: row['presente']))
        .toList();

    return tags;
  }
}
