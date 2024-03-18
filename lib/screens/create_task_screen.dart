import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:todoapp/widgets/widgets.dart';

class CreateTaskScreen extends StatelessWidget {
  static CreateTaskScreen builder(BuildContext context, GoRouterState state) =>
      const CreateTaskScreen();
  const CreateTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const DisplayWhiteText(text: 'Add New Task'),
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const CommonTextField(
              title: 'Task Title',
              hintText: 'Task Title',
            ),
            const Gap(16),
            Row(
              children: [
                const Expanded(
                  child: CommonTextField(
                    title: 'Date',
                    hintText: 'March 20, 2024',
                  ),
                ),
                const Gap(10),
                Expanded(
                  child: CommonTextField(
                    title: 'Time',
                    hintText: DateFormat('kk:mm').format(DateTime.now()),
                  ),
                ),
              ],
            ),
            const Gap(16),
            const CommonTextField(
              title: 'Note (Optional)',
              hintText: 'Task Note',
              maxLines: 6,
            ),
            const Gap(60),
            ElevatedButton(
              onPressed: () {},
              child: const DisplayWhiteText(text: 'Save'),
            ),
          ],
        ),
      ),
    );
  }
}
