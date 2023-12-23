import 'dart:async';

import 'package:lessoncredit/data/lesson_service.dart';

import '../models/lesson.dart';

class LessonBloc{

  final lessonStreamController = StreamController.broadcast();

  Stream get getStream => lessonStreamController.stream;

  List<Lesson>? getAll(){

    return LessonService.getAll();
  }

}


final lessonBloc = LessonBloc();