import 'dart:convert';
import 'dart:math';
import 'dart:developer' as logger;
import '../data/zodiac_sign.dart';
import 'package:http/http.dart' as http;

class SkyMapService {

  final String realApiBase;
  final String mockApiBase;

  SkyMapService({
    required this.realApiBase,
    required this.mockApiBase,
  });

  Future<ZodiacPosition> resolve(ZodiacSign sign) async {

    /// this here could have been the API call. THe url is not correct and I just used a dummy url - the url can be replaced with the readApiBase
    // Uri.parse('realApiBase/zodiac?sign=${sign.name}' <-- could be used if the API is found
    // final url = Uri.parse("https://dummy-sky-api.example.com/zodiac?sign=${sign.name}");
    //
    // try {
    //   final res = await http.get(realApiBase);
    //
    //   if (res.statusCode == 200) {
    //     final data = jsonDecode(res.body);
    //     final ra = (data['raHours'] as num).toDouble();
    //     final dec = (data['decDegrees'] as num).toDouble();
    //      return ZodiacPosition(
    //       raHours: ra,
    //       decDegrees: dec,
    //       source: "https://secure.sky-map.org/",
    //     );
    //   } else {
    //     throw Exception("API error ${res.statusCode}");
    //   }
    // } catch (e) {
    //   // fallback: return static catalog values if API fails
     //return ZodiacPosition(
      //       raHours: sign.raHours,
      //       decDegrees: sign.decDegrees,
      //       source: "https://secure.sky-map.org/",
      //     );
    // }


    try {
      // MOCK API
      final mockRes = await http
          .get(Uri.parse('$mockApiBase/zodiac?sign=${sign.name}'))
          .timeout(const Duration(seconds: 3));

      if (mockRes.statusCode == 200) {
        final data = jsonDecode(mockRes.body);
        return ZodiacPosition(
          raHours: (data['raHours'] as num).toDouble(),
          decDegrees: (data['decDegrees'] as num).toDouble(),
          source: "Mock API",
        );
      }
    } catch (_) {

    }

    //fallback
    return ZodiacPosition(
      raHours: 12.0,
      decDegrees: 0.0,
      source: "Fallback static",
    );
  }
  // Users can tap to open the live sky view.
  Uri skyMapUrl(double raHours, double decDegrees) {
    logger.log('raHours: $raHours, decDegrees: $decDegrees');
    final raDeg = raHours * 15.0;
    final decDeg = decDegrees;
    return Uri.parse(
      'http://www.sky-map.org/?ra=$raDeg&de=$decDeg&zoom=6'
    );
  }
}

class ZodiacPosition {
  final double raHours;
  final double decDegrees;
  final String source;

  ZodiacPosition({
    required this.raHours,
    required this.decDegrees,
    required this.source,
  });
}