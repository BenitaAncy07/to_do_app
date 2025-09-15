import 'package:flutter_test/flutter_test.dart';
import 'package:to_do_app/Model/task.dart';

void main() {
  group('Task Model', () {
    test('taskCompleted() toggles isCompleted correctly or not', () {
      final task = Task(title: 'Test Task', description: 'Test Description');

      expect(task.isCompleted, false); // Initial state

      task.taskCompleted();
      expect(task.isCompleted, true); // After first toggle

      task.taskCompleted();
      expect(task.isCompleted, false); // After second toggle
    });
  });
}
