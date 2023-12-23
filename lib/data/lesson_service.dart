
import '../models/lesson.dart';

class LessonService{
  static List<Lesson> lessons =[];

  static LessonService _singleton = LessonService._internal();

  factory LessonService(){
    return _singleton;

  }

  LessonService._internal();



  static List<Lesson>? getAll(){

    lessons?.add(new Lesson(1, "Matematik",6.0));
    lessons?.add(new Lesson(2, "Fizk",5.0));
    lessons?.add(new Lesson(3, "Kimya",4.0));
    lessons?.add(new Lesson(4, "Tarih",3.0));
    lessons?.add(new Lesson(5, "Felsefe",3.0));
    lessons?.add(new Lesson(6, "Coğrafya",2.0));
    lessons?.add(new Lesson(7, "Müzik",1.0));

    return lessons;
  }

}