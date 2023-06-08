// ignore_for_file: file_names

import 'package:hive/hive.dart';

import 'model.dart';

class Boxes {
  static Box<ModelHive> getData() => Hive.box<ModelHive>('scanData');
}
