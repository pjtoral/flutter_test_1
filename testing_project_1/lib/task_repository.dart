import 'package:testing_project_1/models/Tasks.dart';
import 'package:http/http.dart' as http;

class TaskRepository {
  final http.Client client;

  TaskRepository(this.client);

  Future<Tasks> fetchTasks() async {
    final response = await client
        .get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));

    if (response.statusCode == 200) {
      // CREATE TASK OBJECT
      return Tasks();
    } else {
      throw Exception();
    }
  }
}
