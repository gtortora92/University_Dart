import 'dart:convert';
import 'course.dart';
import 'teacher.dart';
import 'dart:io';
import 'package:path/path.dart' as p;

class University {
  List<Teacher> teachers = [];
  List<Course> courses = [];

  University(String teacherFilePath, String courseFilePath) {
    var teachersFilePath =
        p.join(Directory.current.path, 'assets', teacherFilePath);
    var coursesFilePath =
        p.join(Directory.current.path, 'assets', courseFilePath);

    File teachersFile = File(teachersFilePath);
    File coursesFile = File(coursesFilePath);

    var teachersContent = teachersFile.readAsStringSync();
    var coursesContent = coursesFile.readAsStringSync();

    var teachersData = json.decode(teachersContent)['teachers'];
    var coursesData = json.decode(coursesContent)['courses'];

    for (var teacher in teachersData) {
      var teacherDateOfBirth = DateTime.parse(teacher['dateOfBirth']);
      var t = Teacher(teacher['cf'], teacher['name'], teacher['surname'],
          teacherDateOfBirth, teacher['role'], teacher['department']);
      teachers.add(t);
    }

     for (var course in coursesData) {
      var teacherCourse = findTeacherByCF(course['cf']);
      var c = Course(teacherCourse, course['code'], course['name'],
          course['degreeCourse'], course['description']);
      courses.add(c);
    }
  }

  Teacher findTeacherByCF (cf) {
    return teachers.firstWhere((teacher) => teacher.getCF() == cf);
  }
}
