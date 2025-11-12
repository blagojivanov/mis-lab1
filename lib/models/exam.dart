class Exam {
  final String subjectName;
  final DateTime dateTime;
  final List<String> rooms;
  final bool isPassed;

  Exam({
    required this.subjectName,
    required this.dateTime,
    required this.rooms,
    required this.isPassed,
  });

  bool get isUpcoming => dateTime.isAfter(DateTime.now());

  Duration get timeUntilExam => dateTime.difference(DateTime.now());
}