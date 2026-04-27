import 'dart:io';

import 'package:fruit_hub_dashboard/constant.dart';
import 'package:fruit_hub_dashboard/core/services/storage_services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:path/path.dart' as b;

class SupabaseStorageService extends StorageService {
  static late Supabase _supabase;
  static createBuckets(String bucketname) async {
    _supabase.client.storage.createBucket(bucketname);
  }

  static initSupabase() async {
    _supabase = await Supabase.initialize(
      url: KSupabaseUrl,
      anonKey: KSupabaseKey,
    );
  }
Future<String> uploadImage(File file, String path) async {
  final fileName = DateTime.now().millisecondsSinceEpoch.toString();

  final extension = b.extension(file.path).replaceAll('.', '');

  final filePath = '$path/$fileName.$extension';

  await _supabase.client.storage
      .from('fruits_image')
      .upload(filePath, file);

  return _supabase.client.storage
      .from('fruits_image')
      .getPublicUrl(filePath);
}
}
