import 'dart:convert';
import 'dart:js_interop';
import 'package:test/scaffolding.dart';

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

   Teacher findTeacherByCF(cf) {
    return teachers.firstWhere((teacher) => teacher.getCF() == cf);
  }

  List<Course> findCoursesByTeacherCF(cf) {
    List<Course> courseByTeacher = [];
    for (var course in courses) {
      Teacher teacher = course.getTeacher();
      if (teacher.getCF() == cf) {
        courseByTeacher.add(course);
      }
    }
    return courseByTeacher;
  }

  void printTeachers() {
    print("La lista dei professori è:\n");
    for (var teacher in teachers) {
      teacher.printTeacher();
    }
    print("\n");
  }

  void printCoursesByOneTeacherCF(cf) {
    try{
      Teacher teacher = findTeacherByCF(cf);
      
      List<Course> courseByTeacherCF = findCoursesByTeacherCF(cf);
      if (courseByTeacherCF.isEmpty) {
        print(
            "Il professor ${teacher.getName()} ${teacher.getSurname()} non ha corsi");
      } else {
        print("I corsi di ${teacher.getName()} ${teacher.getSurname()} sono:\n");
        for (var course in courseByTeacherCF) {
          course.printCourse();
        }
      }
      print("\n");
      } catch(e) {
        print("Il professore non esiste");
    };
  }

  void printCourses() {
    print("La lista dei corsi è:\n");
    for (var course in courses) {
      course.printCourse();
    }
    print("\n");
  }
   
}