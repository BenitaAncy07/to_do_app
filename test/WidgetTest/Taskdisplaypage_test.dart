import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/Material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/Controller/Providers/TaskProvider.dart';
import 'package:to_do_app/Model/task.dart';
import 'package:to_do_app/View/Screens/Taskdisplaypage.dart';

void main() {
  testWidgets('Display list of tasks with title and description', (
    WidgetTester tester,
  ) async {
    final mockTasks = [
      Task(
        title: 'Buy groceries',
        description: 'Milk, Eggs, Bread',
        isCompleted: false,
      ),
      Task(title: 'Workout', description: '30 mins cardio', isCompleted: true),
    ];

    final mockProvider = TaskProvider();
    mockProvider.tasks.addAll(mockTasks);

    await tester.pumpWidget(
      AdaptiveTheme(
        light: ThemeData.light(),
        dark: ThemeData.dark(),
        initial: AdaptiveThemeMode.light,
        builder:
            (theme, darkTheme) => MaterialApp(
              theme: theme,
              darkTheme: darkTheme,
              home: ChangeNotifierProvider<TaskProvider>.value(
                value: mockProvider,
                child: const Taskdisplaypage(),
              ),
            ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('Buy groceries'), findsOneWidget);
    expect(find.text('Milk, Eggs, Bread'), findsOneWidget);
  });
}
