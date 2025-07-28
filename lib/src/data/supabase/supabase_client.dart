import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseManager {
  static final SupabaseManager _instance = SupabaseManager._internal();
  factory SupabaseManager() => _instance;
  SupabaseManager._internal();

  bool _isInitialized = false;
  late final SupabaseClient client;

  Future<void> initialize() async {
    if (_isInitialized) return;

    await dotenv.load(fileName: '.env');
    final supabaseUrl = dotenv.env['SUPABASE_URL'];
    final supabaseAnonKey = dotenv.env['SUPABASE_ANON_KEY'];

    assert(supabaseUrl != null && supabaseAnonKey != null, 
        'Supabase credentials not found in .env file');

    try {
      await Supabase.initialize(
        url: supabaseUrl!,
        anonKey: supabaseAnonKey!,
      );
      client = Supabase.instance.client;
      _isInitialized = true;
    } catch (e, st) {
      throw SupabaseInitializationException(
        'Failed to initialize Supabase: $e',
        st,
      );
    }
  }
}

class SupabaseInitializationException implements Exception {
  final String message;
  final StackTrace stackTrace;
  
  SupabaseInitializationException(this.message, this.stackTrace);

  @override
  String toString() => 'SupabaseInitializationException: $message';
}
