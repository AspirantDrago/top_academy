import 'group.dart';

class Event {
  Group group;
  DateTime dateTime;
  int auditoryId;
  String auditory;
  int subjectId;
  String subject;
  int teacherId;
  String teacher;

  Event({
    required this.group,
    required this.dateTime,
    required this.auditoryId,
    required this.auditory,
    required this.subjectId,
    required this.subject,
    required this.teacherId,
    required this.teacher,
  });
}