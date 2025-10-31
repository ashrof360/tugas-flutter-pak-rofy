class Student {
  String id;
  String name;
  String nis;
  Map<String, int> grades; // subject -> score

  Student({
    required this.id,
    required this.name,
    required this.nis,
    Map<String, int>? grades,
  }) : grades = grades ?? {};

  double get average {
    if (grades.isEmpty) return 0;
    final sum = grades.values.fold<int>(0, (a, b) => a + b);
    return sum / grades.length;
  }
}
