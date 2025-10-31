import 'package:flutter/material.dart';
import '../models/student.dart';
import '../services/mock_db.dart';

class RaporProvider extends ChangeNotifier {
  List<Student> _students = List.from(MockDB.students);
  String _currentUserName = 'Andi';
  String role = 'Guru'; // could be 'Guru' or 'Siswa' or 'Admin'

  List<Student> get students => _students;
  List<String> get subjects => MockDB.subjects;
  String get currentUserName => _currentUserName;

  Student? getStudentById(String id) => _students.firstWhere(
    (s) => s.id == id,
    orElse: () => Student(id: 'na', name: 'Unknown', nis: '000'),
  );

  void loginAs({required String name, required String role}) {
    _currentUserName = name;
    this.role = role;
    notifyListeners();
  }

  void addStudent(Student s) {
    _students.add(s);
    notifyListeners();
  }

  void updateGrade({
    required String studentId,
    required String subject,
    required int grade,
  }) {
    final s = _students.firstWhere((st) => st.id == studentId);
    s.grades[subject] = grade;
    notifyListeners();
  }

  void removeStudent(String id) {
    _students.removeWhere((s) => s.id == id);
    notifyListeners();
  }

  double get overallAverage {
    if (_students.isEmpty) return 0;
    final sum = _students.fold<double>(0, (prev, s) => prev + s.average);
    return sum / _students.length;
  }
}
