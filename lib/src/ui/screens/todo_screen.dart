import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/todo_tile.dart';
import '../widgets/add_todo_dialog.dart';
import '../../bloc/todo/todo_bloc.dart';
import '../../bloc/todo/todo_state.dart';

class TodoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc, TodoState>(
      builder: (context, state) {
        if (state is TodoLoading) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        } else if (state is TodoLoaded) {
          return Scaffold(
            appBar: AppBar(
              title: Text('My Todos (${state.filteredTodos.length})'),
              actions: [_buildFilterMenu(context, state.filter)],
            ),
            body: state.filteredTodos.isEmpty
                ? _buildEmptyState()
                : ListView.builder(
                    itemCount: state.filteredTodos.length,
                    itemBuilder: (context, index) {
                      final todo = state.filteredTodos[index];
                      return TodoTile(todo: todo);
                    },
                  ),
            floatingActionButton: FloatingActionButton(
              onPressed: () => _showAddTodoDialog(context),
              child: const Icon(Icons.add),
            ),
          );
        } else if (state is TodoError) {
          return Scaffold(body: Center(child: Text('Error: ${state.message}')));
        }
        return Container();
      },
    );
  }

  Widget _buildEmptyState() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.check_circle_outline, size: 64, color: Colors.grey),
          SizedBox(height: 16),
          Text(
            'No todos yet!',
            style: TextStyle(fontSize: 18, color: Colors.grey),
          ),
          SizedBox(height: 8),
          Text(
            'Tap the + button to create your first todo',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterMenu(BuildContext context, Filter currentFilter) {
    return PopupMenuButton<Filter>(
      icon: const Icon(Icons.filter_list),
      onSelected: (filter) {
        // Handle filter change - in a real app, you'd update the filter in BLoC
      },
      itemBuilder: (context) => [
        const PopupMenuItem(value: Filter.all, child: Text('All')),
        const PopupMenuItem(value: Filter.active, child: Text('Active')),
        const PopupMenuItem(value: Filter.completed, child: Text('Completed')),
      ],
    );
  }

  void _showAddTodoDialog(BuildContext context) {
    // Get the bloc and pass it to the dialog
    final todoBloc = BlocProvider.of<TodoBloc>(context);

    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AddTodoDialog(todoBloc: todoBloc); // Pass the bloc
      },
    );
  }
}
