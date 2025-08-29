import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zodiac_sky_finder/configs/conf.dart';
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
          create: (_) => ZodiacBloc(sky: SkyMapService(realApiBase: '$realApiBase:$defaultPort', mockApiBase: '$mockApiBase:$defaultPort'))..add(const ZodiacInit()),
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