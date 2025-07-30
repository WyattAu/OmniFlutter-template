import '../../../../../core/utils/logger.dart';
import 'supabase_client.dart';

class SupabaseService {
  final SupabaseManager _manager = SupabaseManager();

  bool get isAvailable => _manager.isInitialized;

  Future<List<Map<String, dynamic>>> getTodos(String userId) async {
    if (!isAvailable) return [];

    try {
      final response = await _manager.client
          .from('todos')
          .select()
          .eq('user_id', userId)
          .order('created_at', ascending: false);
      return response;
    } catch (e, stackTrace) {
      AppLogger.error('Error fetching todos', e, stackTrace);
      return [];
    }
  }

  Future<void> insertTodo(Map<String, dynamic> todo) async {
    if (!isAvailable) return;

    try {
      await _manager.client.from('todos').insert(todo);
    } catch (e, stackTrace) {
      AppLogger.error('Error inserting todo', e, stackTrace);
    }
  }

  Future<void> updateTodo(String id, Map<String, dynamic> todo) async {
    if (!isAvailable) return;

    try {
      await _manager.client.from('todos').update(todo).eq('id', id);
    } catch (e, stackTrace) {
      AppLogger.error('Error updating todo', e, stackTrace);
    }
  }

  Future<void> deleteTodo(String id) async {
    if (!isAvailable) return;

    try {
      await _manager.client.from('todos').delete().eq('id', id);
    } catch (e, stackTrace) {
      AppLogger.error('Error deleting todo', e, stackTrace);
    }
  }

  Stream<List<Map<String, dynamic>>> streamTodos(String userId) {
    if (!isAvailable) return Stream.value([]);

    return _manager.client
        .from('todos')
        .stream(primaryKey: ['id'])
        .eq('user_id', userId)
        .order('created_at', ascending: false);
  }
}
