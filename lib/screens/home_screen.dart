import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:todoapp/data/data.dart';

import 'package:todoapp/utils/utils.dart';
import 'package:todoapp/widgets/display_list_of_tasks.dart';
import 'package:todoapp/widgets/display_white_text.dart';

import '../config/routes/routes.dart';

class HomeScreen extends StatelessWidget {
  static HomeScreen builder(BuildContext context, GoRouterState state) =>
      const HomeScreen();
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;
    final deviceSize = context.deviceSize;

    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: deviceSize.height * 0.3,
                width: deviceSize.width,
                color: colors.primary,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DisplayWhiteText(
                      text: 'Aug 7, 2023',
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                    ),
                    Gap(10),
                    DisplayWhiteText(
                      text: 'My Todo List',
                      fontSize: 40,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: 150,
            left: 0,
            right: 0,
            child: SafeArea(
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const DisplayListOfTasks(
                      tasks: [
                        Task(
                            title: "class task",
                            note: "",
                            time: "08:00 AM",
                            date: "03-17-2024",
                            category: TaskCategories.shopping,
                            isCompleted: false),
                        Task(
                            title: "Health Task",
                            note: "note2",
                            time: "10:00 AM",
                            date: "03-31-2024",
                            category: TaskCategories.health,
                            isCompleted: true),
                      ],
                    ),
                    const Gap(20),
                    Text(
                      'Completed',
                      style: context.textTheme.headlineMedium,
                    ),
                    const Gap(20),
                    const DisplayListOfTasks(
                      tasks: [
                        Task(
                            title: "class task",
                            note: "note",
                            time: "08:00 AM",
                            date: "03-17-2024",
                            category: TaskCategories.education,
                            isCompleted: false),
                        Task(
                            title: "Health Task",
                            note: "note2",
                            time: "10:00 AM",
                            date: "03-31-2024",
                            category: TaskCategories.health,
                            isCompleted: true),
                      ],
                      isCompletedTasks: true,
                    ),
                    const Gap(20),
                    ElevatedButton(
                      onPressed: () => context.push(RouteLocation.createTask),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: DisplayWhiteText(text: 'Add New Task'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
