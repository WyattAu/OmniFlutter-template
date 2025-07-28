import 'package:supabase_flutter/supabase_flutter.dart';
import 'supabase_client.dart';

class SupabaseService {
  final client = SupabaseManager().client;

  Future<List<Map<String, dynamic>>> getTodos(String userId) async {
    try {
      final response = await client
          .from('todos')
          .select()
          .eq('user_id', userId)
          .order('created_at', ascending: false);
      return response;
    } catch (e) {
      print('Error fetching todos: $e');
      return [];
    }
  }

  Future<void> insertTodo(Map<String, dynamic> todo) async {
    try {
      await client.from('todos').insert(todo);
    } catch (e) {
      print('Error inserting todo: $e');
    }
  }

  Future<void> updateTodo(String id, Map<String, dynamic> todo) async {
    try {
      await client.from('todos').update(todo).eq('id', id);
    } catch (e) {
      print('Error updating todo: $e');
    }
  }

  Future<void> deleteTodo(String id) async {
    try {
      await client.from('todos').delete().eq('id', id);
    } catch (e) {
      print('Error deleting todo: $e');
    }
  }

  Stream<List<Map<String, dynamic>>> streamTodos(String userId) {
    return client
        .from('todos')
        .stream(primaryKey: ['id'])
        .eq('user_id', userId)
        .order('created_at', ascending: false);
  }
}
