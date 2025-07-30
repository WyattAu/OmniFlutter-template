import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../shared/providers/providers.dart';
import '../widgets/todo_tile.dart';
import '../widgets/add_todo_dialog.dart';
import '../../application/todo_bloc.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<TodoBloc>(
      future: getIt.getAsync<TodoBloc>(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return BlocProvider.value(
            value: snapshot.data!..add(const TodoEvent.loadTodos()),
            child: const TodoView(),
          );
        } else if (snapshot.hasError) {
          return Scaffold(
            body: Center(child: Text('Error: ${snapshot.error}')),
          );
        } else {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }
}

class TodoView extends StatelessWidget {
  const TodoView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc, TodoState>(
      builder: (context, state) {
        return state.when(
          initial: () =>
              const Scaffold(body: Center(child: CircularProgressIndicator())),
          loading: () =>
              const Scaffold(body: Center(child: CircularProgressIndicator())),
          loaded: (todos, filter, isSyncing) {
            final filteredTodos = (state as TodoStateLoaded).filteredTodos;
            return Scaffold(
              appBar: AppBar(
                title: Text('My Todos (${filteredTodos.length})'),
                actions: [
                  _buildFilterMenu(context, filter),
                  if (isSyncing)
                    const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                    ),
                ],
              ),
              body: filteredTodos.isEmpty
                  ? _buildEmptyState()
                  : ListView.builder(
                      itemCount: filteredTodos.length,
                      itemBuilder: (context, index) {
                        final todo = filteredTodos[index];
                        return TodoTile(todo: todo);
                      },
                    ),
              floatingActionButton: FloatingActionButton(
                onPressed: () => _showAddTodoDialog(context),
                child: const Icon(Icons.add),
              ),
            );
          },
          error: (failure) => Scaffold(
            appBar: AppBar(title: const Text('My Todos')),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Error: ${failure.toString()}'),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      context.read<TodoBloc>().add(const TodoEvent.loadTodos());
                    },
                    child: const Text('Retry'),
                  ),
                ],
              ),
            ),
          ),
        );
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
        context.read<TodoBloc>().add(TodoEvent.filterTodos(filter));
      },
      itemBuilder: (context) => [
        const PopupMenuItem(value: Filter.all, child: Text('All')),
        const PopupMenuItem(value: Filter.active, child: Text('Active')),
        const PopupMenuItem(value: Filter.completed, child: Text('Completed')),
      ],
    );
  }

  void _showAddTodoDialog(BuildContext context) {
    final todoBloc = context.read<TodoBloc>();

    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AddTodoDialog(todoBloc: todoBloc);
      },
    );
  }
}
