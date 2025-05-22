import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:top_academy/models/group.dart';

class Api {
  static const String HOST = 'localhost';
  static const int PORT = 8080;

  static String get address {
    return "http://$HOST:$PORT";
  }

  static Future<List<Group>?> getGroups(int filialId) async {
    final response =
        await http.get(Uri(
          scheme: 'http',
          host: HOST,
          port: PORT,
          path: '/filial/$filialId/groups'
        ));
    if (response.statusCode == 200) {
      try {
        final data = json.decode(response.body);
        List<Group> result = [];
        data["groups"]!.forEach((s) {
          result.add(Group(name: s["name"], id: s["id"]));
        });
        return result;
      } catch (e) {
        print('Error with get groups, url: ${response.request?.url}, answer: $e');
        return null;
      }
    }
    return null;
  }
}