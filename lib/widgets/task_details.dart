import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:todoapp/data/data.dart';
import 'package:todoapp/utils/utils.dart';
import 'package:todoapp/widgets/widgets.dart';

class TaskDetails extends StatelessWidget {
  final Task task;

  const TaskDetails({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    final style = context.textTheme;
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        children: [
          CircleContainer(
            color: task.category.color.withOpacity(0.3),
            child: Icon(
              task.category.icon,
              color: task.category.color,
            ),
          ),
          const Gap(20),
          Text(
            task.title,
            style: style.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Text(
            task.time,
            style: style.titleMedium,
          ),
          const Gap(16),
          Visibility(
            visible: !task.isCompleted,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('task to be completed on ${task.date}'),
                Icon(
                  Icons.check_box,
                  color: task.category.color,
                ),
              ],
            ),
          ),
          const Gap(16),
          Visibility(
            visible: task.note.isNotEmpty,
            child: Column(
              children: [
                const Divider(
                  thickness: 2.5,
                ),
                const Gap(16),
                Text(task.note),
              ],
            ),
          ),
          const Gap(16),
          Visibility(
            visible: task.isCompleted,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('task completed'),
                Icon(
                  Icons.check_box,
                  color: Colors.green,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
