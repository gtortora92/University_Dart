import 'teacher.dart';

class Course {
  Teacher _teacher;
  String _code;
  String _name;
  String _degreeCourse;
  String _description;

  Course(this._teacher, this._code, this._name, this._degreeCourse,
      this._description);

  Teacher getTeacher() {
    return _teacher;
  }

  String getCode() {
    return _code;
  }

  String getName() {
    return _name;
  }

  String getDegreeCourse() {
    return _degreeCourse;
  }

  String getDescription() {
    return _description;
  }

  void printCourse() {
    print("$_name ${_teacher.getName()} ${_teacher.getSurname()} $_degreeCourse $_code $_description");
  }
}
