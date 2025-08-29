import 'package:flutter/material.dart';
import 'package:zodiac_sky_finder/data/zodiac_catalog.dart';
import '../../data/zodiac_sign.dart';
import '../../core/constants.dart';


class ZodiacCard extends StatelessWidget {
  final ZodiacSign sign;
  final bool emphasize;
  final VoidCallback? onTap;
  const ZodiacCard({super.key, required this.sign, this.emphasize = false, this.onTap});


  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return InkWell(
      borderRadius: BorderRadius.circular(24),
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        padding: const EdgeInsets.all(16),
        decoration: glassSurface(context).copyWith(
          border: Border.all(color: emphasize ? cs.primary : cs.outlineVariant.withOpacity(0.5)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(sign.symbol, style: TextStyle(fontSize: 20, height: 1.0, color: cs.primary)),
                const SizedBox(width: 5),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(sign.name, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w800)),
                      const SizedBox(height: 2),
                      Text(monthSpan(sign), style: TextStyle(color: cs.onSurfaceVariant, overflow: TextOverflow.ellipsis)),
                    ],
                  ),
                ),
                if (emphasize)
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    decoration: BoxDecoration(
                      color: cs.primaryContainer,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text('Your sign', style: TextStyle(fontWeight: FontWeight.w700, color: cs.onPrimaryContainer)),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}