import '../models/student.dart';

class MockDB {
  static List<Student> students = [
    Student(
      id: 's1',
      name: 'Andi',
      nis: '12345',
      grades: {'Matematika': 85, 'IPA': 80, 'B. Indonesia': 88},
    ),
    Student(
      id: 's2',
      name: 'Siti',
      nis: '12346',
      grades: {'Matematika': 90, 'IPA': 85, 'B. Indonesia': 92},
    ),
    Student(
      id: 's3',
      name: 'Rudi',
      nis: '12347',
      grades: {'Matematika': 78, 'IPA': 75, 'B. Indonesia': 80},
    ),
  ];

  static List<String> subjects = [
    'Matematika',
    'IPA',
    'B. Indonesia',
    'Pendidikan Agama',
  ];
}
