import 'package:flutter_riverpod/legacy.dart';
import 'package:habit/model/model.dart';

class AddHabit extends StateNotifier<List<Habit>> {
  AddHabit() : super([]);
  void add(String name, Days day, bool isdeone) {
    final newitem = Habit(name: name, day: day, isCompleted: isdeone);
    state = [...state, newitem];
  }

  void remove(String id) {
    state = state.where((item) => item.id != id).toList();
  }
}

final addHabitNotifier = StateNotifierProvider((ref) {
  return AddHabit();
});
