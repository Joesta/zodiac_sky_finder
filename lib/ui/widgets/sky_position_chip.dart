import 'package:flutter/material.dart';

class SkyPositionChip extends StatelessWidget {
  final String raLabel;
  final String decLabel;
  final VoidCallback? onOpen;
  const SkyPositionChip({super.key, required this.raLabel, required this.decLabel, this.onOpen});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        Chip(
          label: Text('RA $raLabel'),
          avatar: const Icon(Icons.more_time_outlined),
        ),
        Chip(
          label: Text('Dec $decLabel'),
          avatar: const Icon(Icons.explore_outlined),
        ),
        ActionChip(
          label: const Text('Open in Sky‑Map'),
          avatar: const Icon(Icons.open_in_new),
          onPressed: onOpen,
          backgroundColor: cs.secondaryContainer,
          labelStyle: TextStyle(color: cs.onSecondaryContainer, fontWeight: FontWeight.w700),
        ),
      ],
    );
  }
}