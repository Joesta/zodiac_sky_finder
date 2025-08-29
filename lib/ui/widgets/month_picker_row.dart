import 'package:flutter/material.dart';

class MonthPickerRow extends StatelessWidget {
  final int selectedMonth;
  final ValueChanged<int> onPick;
  const MonthPickerRow({required this.selectedMonth, required this.onPick});


  @override
  Widget build(BuildContext context) {
    final months = List.generate(12, (i) => i + 1);
    return SizedBox(
      height: 56,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 4),
        itemCount: months.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, i) {
          final m = months[i];
          final selected = m == selectedMonth;
          return FilterChip(
            label: Text(_label(m)),
            selected: selected,
            onSelected: (_) => onPick(m),
          );
        },
      ),
    );
  }


  String _label(int m) => const [
    'Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'
  ][m - 1];
}