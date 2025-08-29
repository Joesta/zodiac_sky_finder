import 'dart:convert';
import 'dart:io';
import 'package:astro_mock_api/astro_mock_api.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_cors_headers/shelf_cors_headers.dart';
import 'package:shelf_router/shelf_router.dart';

void main(List<String> args) async {
  final router = Router();
  final defaultPort = '1250';

  // Endpoint: GET /zodiac?sign=Aries
  router.get('/zodiac', (Request req) {
    final sign = req.url.queryParameters['sign'];
    if (sign == null || !signs.containsKey(sign)) {
      return Response.notFound(jsonEncode({"error": "Sign not found"}));
    }
    return Response.ok(jsonEncode(signs[sign]!),
        headers: {'Content-Type': 'application/json'});
  });

  final handler = const Pipeline()
      .addMiddleware(logRequests())
      .addMiddleware(corsHeaders())
      .addHandler(router.call);

  final port = int.parse(Platform.environment['PORT'] ?? defaultPort);
  final server = await io.serve(handler, 'localhost', port);
  print('Mock API listening on http://${server.address.host}:${server.port}');
}
