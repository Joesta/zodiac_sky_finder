import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zodiac_sky_finder/bloc/zodiac_bloc.dart';
import 'package:zodiac_sky_finder/core/constants.dart';
import 'package:zodiac_sky_finder/core/utils.dart';
import 'package:zodiac_sky_finder/data/zodiac_catalog.dart';
import 'package:zodiac_sky_finder/ui/widgets/month_picker_row.dart';
import 'package:zodiac_sky_finder/ui/widgets/sky_position_chip.dart';
import 'package:zodiac_sky_finder/ui/widgets/zodiac_badge.dart';
import 'package:zodiac_sky_finder/ui/widgets/zodiac_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Zodiac Sky Finder')),
      body: BlocBuilder<ZodiacBloc, ZodiacState>(
        builder: (context, state) {
          final current = state.currentSign;
          return ListView(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 28),
            children: [
              Container(
                decoration: glassSurface(context),
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Night sky ~ ${state.currentDate != null ? monthLabel(state.currentDate!) : monthLabel(DateTime.now())}',
                      style: TextStyle(color: cs.onSurfaceVariant),
                    ),
                    const SizedBox(height: 6),
                    Text('Find your sign', style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w800)),
                    const SizedBox(height: 12),
                    if (current != null) ZodiacBadge(sign: current, emphasize: state.isUserCurrent),
                    const SizedBox(height: 14),
                    if (state.status == ZodiacStatus.loading)
                      const LinearProgressIndicator(minHeight: 4),
                    if (state.status == ZodiacStatus.ready && state.raHours != null && state.decDegrees != null)
                      SkyPositionChip(
                        raLabel: formatRa(state.raHours!),
                        decLabel: formatDec(state.decDegrees!),
                        onOpen: () async {
                          final url = context.read<ZodiacBloc>().sky.skyMapUrl(state.raHours!, state.decDegrees!);
                          launchUrl(url, mode: LaunchMode.externalApplication);
                        },
                      ),
                  ],
                ),
              ),

              const SizedBox(height: 12),

              MonthPickerRow(
                selectedMonth: (state.currentDate ?? DateTime.now()).month,
                onPick: (m) => context.read<ZodiacBloc>().add(ZodiacSetMonth(m)),
              ),

              const SizedBox(height: 12),

              // User sign selector
              Container(
                decoration: glassSurface(context),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Your sign', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800)),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: [
                        for (final s in kZodiac)
                          ChoiceChip(
                            label: Text('${s.symbol} ${s.name}'),
                            selected: state.userSign?.name == s.name,
                            onSelected: (_) => context.read<ZodiacBloc>().add(ZodiacSetUserSign(s)),
                          ),
                        ChoiceChip(
                          label: const Text('None'),
                          selected: state.userSign == null,
                          onSelected: (_) => context.read<ZodiacBloc>().add(const ZodiacSetUserSign(null)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 12),

              // All signs grid
              Text('All astrological signs', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800)),
              const SizedBox(height: 8),
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: kZodiac.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 1.4,
                ),
                itemBuilder: (context, i) {
                  final s = kZodiac[i];
                  return ZodiacCard(
                    sign: s,
                    emphasize: state.userSign?.name == s.name,
                    onTap: () => context.read<ZodiacBloc>().add(ZodiacSetMonth(s.start.month)),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}