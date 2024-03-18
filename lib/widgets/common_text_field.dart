import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:todoapp/utils/utils.dart';

class CommonTextField extends StatelessWidget {
  const CommonTextField({
    super.key,
    required this.title,
    required this.hintText,
    this.controller,
    this.maxLines,
  });

  final String title;
  final String hintText;
  final TextEditingController? controller;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          title,
          style: context.textTheme.titleLarge,
        ),
        const Gap(10),
        TextField(
          controller: controller,
          maxLines: maxLines,
          onTapOutside: (event) {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          decoration: InputDecoration(
            hintText: hintText,
          ),
          onChanged: (value) {},
        ),
      ],
    );
  }
}
