import "package:path/path.dart";

import "course.dart";
import "teacher.dart";
import "university.dart";

void main() {

  University u1 = University('teachers.json', 'courses.json');
  u1.printTeachers();
  u1.printCourses();

  u1.findCoursesByTeacherCF("aaaa");

  u1.printCoursesByOneTeacherCF("aaaadd");
   

  }

