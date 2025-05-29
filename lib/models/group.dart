import 'package:hive/hive.dart';

part 'group.g.dart';

@HiveType(typeId: 0)
class Group extends HiveObject {

  @HiveField(0)
  int id;

  @HiveField(1)
  String name;

  Group({
    required this.id,
    required this.name
  });
}