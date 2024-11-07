import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/domain/models/todo.dart';
import 'package:todo_app/domain/repository/todo_repo.dart';

class TodoCubit extends Cubit<List<Todo>> {
  final TodoRepo todoRepo;

  TodoCubit(this.todoRepo) : super([]) {
    loadTodos();
  }

  Future<void> loadTodos() async {
    final todos = await todoRepo.getTodos();
    emit(todos);
  }

  Future<void> addTodo(String text) async {
    final newTodo = Todo(id: DateTime.now().microsecondsSinceEpoch, text: text);

    await todoRepo.addTodo(newTodo);

    loadTodos();
  }

  // delete todo
  Future<void> delete(Todo todo) async {
    await todoRepo.deleteTodo(todo);

    loadTodos();
  }

  // toggle todo
  Future<void> toggleCompletion(Todo todo) async {
    final updatedTodo = todo.toggleCompletion();

    await todoRepo.updateTodo(updatedTodo);

    loadTodos();
  }
}
