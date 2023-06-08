import "course.dart";
import "teacher.dart";
void main() {
  print("First Commit");

  Teacher t1 = Teacher("aaa", "gino", "gino", DateTime(1000,10,09), "ricercatore", "ING-INF/05");
  Teacher t2 = Teacher("aaa", "gino", "gino", DateTime(1000,10,09), "ricercatore", "ING-INF/05");
 
 Course c1 = Course(t1, "64-365", "Algebra", "Informatica triennale", "Corso di base di algebra");

 Teacher c1Teacher = c1.getTeacher();
 print(c1Teacher.getCF());
 print(c1Teacher.getName());
}
