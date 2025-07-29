import 'dart:io' show Platform; // for env variables
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseManager {
  static final SupabaseManager _instance = SupabaseManager._internal();
  factory SupabaseManager() => _instance;
  SupabaseManager._internal();

  bool _isInitialized = false;
  late final SupabaseClient client;

  // Expose the isInitialized property
  bool get isInitialized => _isInitialized;

  Future<void> initialize() async {
    if (_isInitialized) return;

    // Try to load from environment variables first (GitHub secrets)
    String? supabaseUrl = Platform.environment['SUPABASE_URL'];
    String? supabaseAnonKey = Platform.environment['SUPABASE_ANON_KEY'];

    // Fallback to .env file if environment variables are not set
    if (supabaseUrl == null || supabaseAnonKey == null) {
      await dotenv.load(fileName: '.env');
      supabaseUrl = dotenv.env['SUPABASE_URL'];
      supabaseAnonKey = dotenv.env['SUPABASE_ANON_KEY'];
    }

    assert(
      supabaseUrl != null && supabaseAnonKey != null,
      'Supabase credentials not found in environment variables or .env file',
    );

    try {
      await Supabase.initialize(url: supabaseUrl!, anonKey: supabaseAnonKey!);
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
