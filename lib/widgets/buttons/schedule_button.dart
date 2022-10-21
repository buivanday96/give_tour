import 'package:flutter/material.dart';

class ScheduleButton extends StatelessWidget {
  const ScheduleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: () {},
      icon: const Icon(Icons.event_note),
      label: const Text('Full Schedules'),
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.only(left: 16, right: 16),
        side: BorderSide(
          color: Theme.of(context).colorScheme.primary,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
