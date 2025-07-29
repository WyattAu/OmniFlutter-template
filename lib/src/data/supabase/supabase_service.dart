import 'supabase_client.dart';
import 'package:flutter/foundation.dart';

class SupabaseService {
  final SupabaseManager _manager = SupabaseManager();

  // Check if Supabase is initialized before using
  bool get isAvailable => _manager.isInitialized;

  Future<List<Map<String, dynamic>>> getTodos(String userId) async {
    if (!isAvailable) {
      debugPrint('Supabase not available, returning empty list');
      return [];
    }

    try {
      final response = await _manager.client
          .from('todos')
          .select()
          .eq('user_id', userId)
          .order('created_at', ascending: false);
      return response;
    } catch (e) {
      debugPrint('Error fetching todos: $e');
      return [];
    }
  }

  Future<void> insertTodo(Map<String, dynamic> todo) async {
    if (!isAvailable) {
      debugPrint('Supabase not available, skipping insert');
      return;
    }

    try {
      await _manager.client.from('todos').insert(todo);
    } catch (e) {
      debugPrint('Error inserting todo: $e');
    }
  }

  Future<void> updateTodo(String id, Map<String, dynamic> todo) async {
    if (!isAvailable) {
      debugPrint('Supabase not available, skipping update');
      return;
    }

    try {
      await _manager.client.from('todos').update(todo).eq('id', id);
    } catch (e) {
      debugPrint('Error updating todo: $e');
    }
  }

  Future<void> deleteTodo(String id) async {
    if (!isAvailable) {
      debugPrint('Supabase not available, skipping delete');
      return;
    }

    try {
      await _manager.client.from('todos').delete().eq('id', id);
    } catch (e) {
      debugPrint('Error deleting todo: $e');
    }
  }

  Stream<List<Map<String, dynamic>>> streamTodos(String userId) {
    if (!isAvailable) {
      debugPrint('Supabase not available, returning empty stream');
      return Stream.value([]);
    }

    return _manager.client
        .from('todos')
        .stream(primaryKey: ['id'])
        .eq('user_id', userId)
        .order('created_at', ascending: false);
  }
}