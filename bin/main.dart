import "package:path/path.dart";

import "course.dart";
import "teacher.dart";
import "university.dart";

void main() {
  print("First Commit");

  Teacher t1 = Teacher("aaaa", "Dino", "Sasso", DateTime(1000, 10, 15),
      "ricercatore", "ING-INF/05");
  Teacher t2 = Teacher("aaa", "gino", "gino", DateTime(1000, 10, 15),
      "ricercatore", "ING-INF/05");

Course c1 = Course(t1, "64-365", "Algebra", "Algebra triennale", "Corso base di algebra");  

//  Teacher c1Teacher = c1.getTeacher();

  University u1 = University('teachers.json', 'courses.json');

  t1.printTeacher();
  t2.printTeacher();

  c1.printCourse();
}
