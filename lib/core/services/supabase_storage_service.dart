import 'dart:io';

import 'package:fruit_hub_dashboard/constant.dart';
import 'package:fruit_hub_dashboard/core/services/storage_services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:path/path.dart' as b;

class SupabaseStorageService extends StorageService {
  static late Supabase _supabase;
  static initSupabase() async {
    _supabase = await Supabase.initialize(
      url: KSupabaseUrl,
      anonKey: KSupabaseKey,
    );
  }

  @override
  Future<String> uploadImage(File file, String path) async {
    String fileName = b.basename(file.path);
    String extensionName = b.extension(file.path);
    var result = await _supabase.client.storage
        .from('fruits_image')
        .upload('$path/$fileName.$extensionName', file);
    return result;
  }
}
