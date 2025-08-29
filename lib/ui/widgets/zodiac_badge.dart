import 'package:flutter/material.dart';
import '../../data/zodiac_sign.dart';

class ZodiacBadge extends StatelessWidget {
  final ZodiacSign sign;
  final bool emphasize;
  const ZodiacBadge({super.key, required this.sign, this.emphasize = false});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return AnimatedScale(
      scale: emphasize ? 1.08 : 1.0,
      duration: const Duration(milliseconds: 200),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: emphasize ? cs.primaryContainer : cs.surfaceVariant,
          borderRadius: BorderRadius.circular(100),
          border: Border.all(color: emphasize ? cs.primary : cs.outlineVariant),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(sign.symbol, style: TextStyle(fontSize: 24, color: emphasize ? cs.onPrimaryContainer : cs.onSurfaceVariant)),
            const SizedBox(width: 10),
            Text(sign.name, style: TextStyle(fontWeight: FontWeight.w700, color: emphasize ? cs.onPrimaryContainer : cs.onSurfaceVariant)),
          ],
        ),
      ),
    );
  }
}