import 'package:flutter/material.dart';
import 'package:habit/screens/make_habit.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton.filled(
              onPressed: () {},
              icon: const Icon(Icons.person, color: Colors.white),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 10),
              const Center(child: Text('Start Your Jounrney')),
              const SizedBox(height: 15),

              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.black),
                ),
                child: const Placeholder(),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  side: const BorderSide(width: 1, color: Colors.black),

                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: const Text(
                  'Set a Goal',
                  style: TextStyle(fontSize: 22, color: Colors.black),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  side: const BorderSide(width: 1, color: Colors.black),

                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: const Text(
                  'Make a Routine',
                  style: TextStyle(fontSize: 22, color: Colors.black),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(
                    context,
                  ).push(MaterialPageRoute(builder: (_) => const MakeHabit()));
                },
                style: ElevatedButton.styleFrom(
                  side: const BorderSide(width: 1, color: Colors.black),

                  backgroundColor: Colors.white,

                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: const Text(
                  'Make a Habit',
                  style: TextStyle(fontSize: 22, color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
