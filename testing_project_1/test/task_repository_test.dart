import 'package:flutter_test/flutter_test.dart';
import 'package:testing_project_1/models/Tasks.dart';
import 'package:testing_project_1/task_repository.dart';
import 'package:mocktail/mocktail.dart';
import 'package:http/http.dart';

class MockHttpClient extends Mock implements Client {}

void main() {
  late MockHttpClient mockHttpClient;
  late TaskRepository taskRepository;

  setUp(() {
    mockHttpClient = MockHttpClient();
    taskRepository = TaskRepository(mockHttpClient);
  });

  group(
    'todos-api',
    () {
      String url = 'https://jsonplaceholder.typicode.com/todos';
      test(
        'Given task repository is instantiated, when fetchTasks is called and return is 200, then a Tasks object should be returned',
        () async {
          when(() => mockHttpClient.get(Uri.parse(url))).thenAnswer(
            (_) => Future.delayed(
              Duration.zero,
              () => Response('''
          [
            {
              "userId": 1,
              "id": 1,
              "title": "delectus aut autem",
              "completed": false
            }
          ]
          ''', 200),
            ),
          );

          Tasks tasks = await taskRepository.fetchTasks();

          expect(tasks, isA<Tasks>());

          verify(
            () => mockHttpClient.get(Uri.parse(url)),
          ).called(1);
        },
      );

      test(
        'Given task repository is instantiated, when the fetchTasks is called and return 404, then thow an exception',
        () async {
          when(() => mockHttpClient.get(Uri.parse(url))).thenAnswer(
            (_) => Future.delayed(
              Duration.zero,
              () => Response('', 404),
            ),
          );

          expect(() => taskRepository.fetchTasks(), throwsException);
        },
      );
    },
  );
}
