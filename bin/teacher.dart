class Teacher {
  final String _cf;
  final String _name;
  final String _surname;
  final DateTime _dateOfBirth;
  String _role;
  String _department;

  Teacher(this._cf, this._name, this._surname, this._dateOfBirth, this._role,
      this._department);

  String getCF() {
    return _cf;
  }

  String getName() {
    return _name;
  }

  String getSurname() {
    return _surname;
  }

  DateTime getDateOfBirth() {
    return _dateOfBirth;
  }

  String getRole() {
    return _role;
  }

  String getDepartment() {
    return _department;
  }
}
