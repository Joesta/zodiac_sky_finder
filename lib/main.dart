import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app_theme.dart';
import 'services/sky_map_service.dart';
import 'bloc/zodiac_bloc.dart';
import 'ui/screens/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ZodiacApp());
}

class ZodiacApp extends StatelessWidget {
  const ZodiacApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          // realAPiBase - same as mockApiBase because I can't find the real API.
          create: (_) => ZodiacBloc(sky: SkyMapService(realApiBase: 'http://10.0.2.2:1250', mockApiBase: 'http://10.0.2.2:1250'))..add(const ZodiacInit()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Zodiac Sky Finder',
        theme: AppTheme.light(),
        home: const HomeScreen(),
      ),
    );
  }
}