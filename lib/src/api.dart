import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:top_academy/models/event.dart';
import 'package:top_academy/models/group.dart';

class Api {
  static const String host = 'localhost';
  static const int port = 8080;
  static DateFormat dateFormatterAPI = DateFormat('yyyy-MM-dd');

  static late Box<Group> groupBox;

  static String get address {
    return "http://$host:$port";
  }

  static Future<void> initial() async {
    Hive.registerAdapter(GroupAdapter());
    groupBox = await Hive.openBox<Group>('groups');
  }

  static Future<List<Event>?> getEvents({
    required int filialId,
    int? groupId,
    required DateTime date
  }) async {
    http.Response? response;
    var dateString = dateFormatterAPI.format(date);
    try {
      List<Event> result = [];
      response = await http.get(Uri(
        scheme: 'http',
        host: host,
        port: port,
        path: (groupId != null) ? '/filial/$filialId/events/date/$dateString/group/$groupId/' : '/filial/$filialId/events/date/$dateString/',
      ));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        await data!.forEach((s) async {
          Event obj = Event(
            group: groupBox.get(s['groupId'].toString())!,
            dateTime: DateTime.parse(s['date'] + ' ' + s['time']),
            auditoryId: s['auditorium']['id'],
            auditory: s['auditorium']['name'],
            subjectId: s['subject'] == null ? null : s['subject']['id'],
            subject: s['name'],
            teacherId: s['teacher']['id'],
            teacher: s['teacher']['full_name'],
          );
          result.add(obj);
        });
        return result;
      }
    } catch (e)  {
      if (kDebugMode) {
        print('Error with get events, url: ${response?.request?.url}, answer: $e');
      }
      return null;
    }
    return null;
  }

  static Future<List<Group>?> getGroups(int filialId) async {
    await _getGroups(filialId);
    return groupBox.values.toList();
  }

  static Future<List<Group>?> _getGroups(int filialId) async {
    http.Response? response;
    try {
      response = await http.get(Uri(
          scheme: 'http',
          host: host,
          port: port,
          path: '/filial/$filialId/groups',
      ));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        List<Group> result = [];
        await groupBox.clear();
        await data!.forEach((s) async {
          Group g = Group(name: s['name'], id: s['id']);
          result.add(g);
          await groupBox.put(g.id.toString(), g);
        });
        return result;
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error with get groups, url: ${response?.request?.url}, answer: $e');
      }
      return null;
    }
    return null;
  }
}