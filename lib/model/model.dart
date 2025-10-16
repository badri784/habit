import 'package:uuid/uuid.dart';

enum Days { mon, tue, wed, thu, fri, sat, sun }

enum Mode { normal, disciplined }

final uuid = const Uuid();

class Habit {
  final String id;
  final String name;
  final Days day;
  final bool isCompleted;

  Habit({
    required this.isCompleted,
    String? id,
    required this.name,
    required this.day,
  }) : id = id ?? uuid.v4();
}
