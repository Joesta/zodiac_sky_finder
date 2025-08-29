import 'package:flutter/material.dart';

const kHeroRadius = 28.0;
const kGlass = 0.08;
final kRoundedRectangleBorder = RoundedRectangleBorder(borderRadius: BorderRadius.circular(10));

BoxDecoration glassSurface(BuildContext context) {
  final cs = Theme.of(context).colorScheme;
  return BoxDecoration(
    borderRadius: BorderRadius.circular(24),
    gradient: LinearGradient(
      colors: [
        cs.primary.withOpacity(kGlass + 0.04),
        cs.secondary.withOpacity(kGlass),
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    border: Border.all(color: cs.primary.withOpacity(0.12)),
    boxShadow: [
      BoxShadow(
        color: cs.primary.withOpacity(0.08),
        blurRadius: 24,
        offset: const Offset(0, 12),
      )
    ],
  );
}