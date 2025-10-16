// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habit/model/model.dart';
import 'package:habit/provider/add_habit.dart';

class MakeHabit extends ConsumerStatefulWidget {
  const MakeHabit({super.key});

  @override
  ConsumerState<MakeHabit> createState() => _MakeHabitState();
}

class _MakeHabitState extends ConsumerState<MakeHabit>
    with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: Days.values.length, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  Mode selectModel = Mode.normal;
  @override
  Widget build(BuildContext context) {
    bool value = false;
    final item = ref.watch(addHabitNotifier);
    void showAddHabitDialog(Days day) {
      final TextEditingController habitController = TextEditingController();
      showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: Text('Add Habit for ${day.toString()}'),
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: habitController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter your habit',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    border: BoxBorder.all(width: 2, color: Colors.black54),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Mode :'),
                      Row(
                        children: [
                          Radio<Mode>(
                            value: Mode.normal,
                            groupValue: selectModel,
                            onChanged: (value) {
                              setState(() {
                                selectModel = value!;
                              });
                            },
                          ),
                          const Text('Normal'),
                          Radio<Mode>(
                            value: Mode.disciplined,
                            groupValue: selectModel,
                            onChanged: (value) {
                              setState(() {
                                selectModel = value!;
                              });
                            },
                          ),
                          const Text('Disciplined   '),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Row(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 20,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        onPressed: () {
                          final habit = habitController.text;
                          if (habit.isNotEmpty) {
                            final text = habitController.text;
                            ref
                                .read(addHabitNotifier.notifier)
                                .add(text, day, value);
                          }
                          Navigator.pop(context);
                        },
                        child: const Text('Submit'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Make a Habit'), centerTitle: true),
      body: Column(
        children: [
          TabBar(
            indicatorWeight: 1,
            dividerColor: Colors.transparent,
            isScrollable: true,
            tabs: [
              for (var day in Days.values) Tab(text: day.name.toUpperCase()),
            ],
            controller: tabController,
            onTap: (value) {
              showAddHabitDialog(Days.values[value]);
            },
          ),
          Expanded(
            child: ListView.builder(
              itemCount: item.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card.outlined(
                  child: ListTile(
                    title: Row(
                      children: [
                        Expanded(child: Text(item[index].name, maxLines: 3)),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Container(
                            width: 50,
                            height: 43,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: BoxBorder.all(
                                width: 2,
                                color: Colors.black54,
                              ),
                            ),
                            child: const Center(child: Text('Alarts')),
                          ),
                        ),
                      ],
                    ),
                    leading: CircleAvatar(
                      radius: 25,
                      child: Text(item[index].day.name.toUpperCase()),
                    ),
                    trailing: Checkbox(
                      shape: const CircleBorder(),
                      value: value,
                      onChanged: (bool? val) {
                        setState(() {
                          value = val!;
                        });
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
