import '../models/student.dart';

class MockDB {
  static List<Student> students = [
    Student(
      id: 's1',
      name: 'Rangga Putra Baidillah',
      nis: '12345',
      grades: {'Matematika': 85, 'IPA': 80, 'B. Indonesia': 88},
    ),
    Student(
      id: 's2',
      name: 'Dewi Nurul Aulia',
      nis: '12346',
      grades: {'Matematika': 90, 'IPA': 85, 'B. Indonesia': 92},
    ),
    Student(
      id: 's3',
      name: 'Abdul Jalil',
      nis: '12347',
      grades: {'Matematika': 78, 'IPA': 75, 'B. Indonesia': 80},
    ),
    Student(
      id: 's3',
      name: 'Moh.Haikal Ramzi',
      nis: '12347',
      grades: {'Matematika': 78, 'IPA': 75, 'B. Indonesia': 80},
    ),
    Student(
      id: 's3',
      name: 'Muhammad Hafidillah',
      nis: '12347',
      grades: {'Matematika': 78, 'IPA': 75, 'B. Indonesia': 80},
    ),
    Student(
      id: 's3',
      name: 'Muhammad Raihan Saifullah',
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
