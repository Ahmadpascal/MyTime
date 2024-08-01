import 'package:get/get.dart';
import 'package:mytime/DatabaseHelper/repository.dart';
import 'package:mytime/Models/task.dart';

class TaskControllers extends GetxController{
  final TaskRepository taskRepository = TaskRepository();

  @override
  void onReady() {
    super.onReady();
  }

  Future<void> addTask({required Task task}) async{
    await taskRepository.addTask(task);
  }
}