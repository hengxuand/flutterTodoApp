import 'package:flutter/material.dart';
import 'package:todoapp/data/models/task.dart';
import 'package:todoapp/utils/utils.dart';
import 'package:todoapp/widgets/task_details.dart';
import 'package:todoapp/widgets/task_tile.dart';

import 'common_container.dart';

class DisplayListOfTasks extends StatelessWidget {
  const DisplayListOfTasks(
      {super.key, required this.tasks, this.isCompletedTasks = false});

  final List<Task> tasks;
  final bool isCompletedTasks;

  @override
  Widget build(BuildContext context) {
    final deviceSize = context.deviceSize;
    final height =
        isCompletedTasks ? deviceSize.height * 0.25 : deviceSize.height * 0.3;
    final emptyTasksMessage =
        isCompletedTasks ? 'no completed tasks yet' : 'No tasks yet';

    return CommonContainer(
      height: height,
      child: tasks.isEmpty
          ? Center(
              child: Text(
                emptyTasksMessage,
                style: context.textTheme.headlineSmall,
              ),
            )
          : ListView.separated(
              shrinkWrap: true,
              itemCount: tasks.length,
              padding: EdgeInsets.zero,
              itemBuilder: (ctx, index) {
                final task = tasks[index];
                return InkWell(
                  onLongPress: () {
                    // TODO: delete task
                  },
                  onTap: () async {
                    // TODO: show details of the task
                    await showModalBottomSheet(
                      context: context,
                      builder: (ctx) {
                        return TaskDetails(task: task);
                      },
                    );
                  },
                  child: TaskTile(task: task),
                );
              },
              separatorBuilder: (context, index) {
                return const Divider(
                  thickness: 1.5,
                );
              },
            ),
    );
  }
}
