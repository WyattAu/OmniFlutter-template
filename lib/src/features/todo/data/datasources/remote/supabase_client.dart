import 'dart:io' show Platform;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter/foundation.dart';

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

    debugPrint('Initializing Supabase...');

    // Try to load from environment variables first (GitHub secrets)
    String? supabaseUrl = Platform.environment['SUPABASE_URL'];
    String? supabaseAnonKey = Platform.environment['SUPABASE_ANON_KEY'];

    debugPrint(
      'Environment variables - URL: ${supabaseUrl != null}, Key: ${supabaseAnonKey != null}',
    );

    // Fallback to .env file if environment variables are not set
    if (supabaseUrl == null || supabaseAnonKey == null) {
      debugPrint('Loading from .env file...');
      try {
        await dotenv.load(fileName: '.env');
        supabaseUrl = dotenv.env['SUPABASE_URL'];
        supabaseAnonKey = dotenv.env['SUPABASE_ANON_KEY'];
        debugPrint(
          'Loaded from .env - URL: ${supabaseUrl != null}, Key: ${supabaseAnonKey != null}',
        );
      } catch (e, stackTrace) {
        debugPrint('Failed to load .env file: $e');
        debugPrint('Stack trace: $stackTrace');

        // For development, you might want to use placeholder values
        // Remove these in production!
        if (kDebugMode) {
          debugPrint('WARNING: Using placeholder credentials for development');
          // supabaseUrl = 'your_development_url';
          // supabaseAnonKey = 'your_development_key';
        }
      }
    }

    // Final check
    if (supabaseUrl == null || supabaseAnonKey == null) {
      debugPrint(
        'Supabase credentials not found. Skipping Supabase initialization.',
      );
      // Don't throw error, just mark as initialized without client
      _isInitialized = true;
      return;
    }

    try {
      debugPrint('Initializing Supabase client...');
      await Supabase.initialize(url: supabaseUrl, anonKey: supabaseAnonKey);
      client = Supabase.instance.client;
      _isInitialized = true;
      debugPrint('Supabase initialized successfully');
    } catch (e, st) {
      debugPrint('Failed to initialize Supabase: $e');
      debugPrint('Stack trace: $st');
      // Don't throw error, continue without Supabase
      _isInitialized = true;
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
