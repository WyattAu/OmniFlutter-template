import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseManager {
  static final SupabaseManager _instance = SupabaseManager._internal();
  factory SupabaseManager() => _instance;
  SupabaseManager._internal();

  late final SupabaseClient client;

  Future<void> initialize() async {
    // TODO: Replace with your actual Supabase credentials
    await Supabase.initialize(
      url: 'https://yclunwdxvgontmfezqdb.supabase.co',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InljbHVud2R4dmdvbnRtZmV6cWRiIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTM2NDYzMDIsImV4cCI6MjA2OTIyMjMwMn0.U91REp1bScB4muCLVYew9I38fSwXaYWBm9n0WXA8cT4',
    );
    client = Supabase.instance.client;
  }
}
