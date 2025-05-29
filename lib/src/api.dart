import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:top_academy/models/group.dart';

class Api {
  static const String host = 'localhost';
  static const int port = 8080;

  static late Box<Group> groupBox;

  static String get address {
    return "http://$host:$port";
  }

  static Future<void> initial() async {
    // Hive.registerAdapter();
    // GroupAdapter()
    groupBox = await Hive.openBox<Group>('groups');
  }

  static Future<List<Group>?> getGroups(int filialId) async {
    final response =
        await http.get(Uri(
          scheme: 'http',
          host: host,
          port: port,
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
        if (kDebugMode) {
          print('Error with get groups, url: ${response.request?.url}, answer: $e');
        }
        return null;
      }
    }
    return null;
  }
}