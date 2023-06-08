import 'course.dart';
import 'teacher.dart';
import 'dart:io';

class University {
  List<Teacher> teachers = [];
  List<Course> courses = [];

  University.fromTxtFiles(String teacherFilePath, String courseFilePath);

}

