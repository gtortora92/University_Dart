import 'course.dart';
import 'teacher.dart';
import 'dart:io';
import 'package:path/path.dart' as p;

class University {
  List<Teacher> teachers = [];
  List<Course> courses = [];

  University (String teacherFilePath, String courseFilePath) {
    var teachersFilePath = p.join(Directory.current.path, 'assets', teacherFilePath);
    var coursesFilePath = p.join(Directory.current.path, 'assets', courseFilePath);

    File teachesFile = File(teachersFilePath);
    File coursesFile = File(coursesFilePath);

    var teachersContent = teachesFile.readAsStringSync();
    var coursesContent = coursesFile.readAsStringSync();

    print(teachersContent);
    print(coursesContent);
  }

}

