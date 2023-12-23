import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lessoncredit/models/cart.dart';

import '../blocs/cart_bloc.dart';
import '../blocs/lesson_bloc.dart';
import '../models/lesson.dart';

class LessonListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Dersler",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        backgroundColor: Colors.blueGrey,
        leading: Icon(
          Icons.library_books,
        ),
        actions: <Widget>[
          IconButton(
              onPressed: () => Navigator.pushNamed(context, "/cart"),
              icon: Icon(Icons.archive))
        ],
      ),
      body: buildLessonList(),
    );
  }

  buildLessonList() {
    return StreamBuilder(
      initialData: lessonBloc.getAll(),
      stream: lessonBloc.getStream,
      builder: (context, snapshot) {
        return snapshot.data.length > 0
            ? buildLessonListItems(snapshot)
            : Center(
                child: Text("Data Yok"),
              );
      },
    );
  }

  buildLessonListItems(AsyncSnapshot snapshot) {
    return ListView.builder(
      itemCount: snapshot.data.length,
      itemBuilder: (BuildContext context, index) {
        final list = snapshot.data;
        return ListTile(
          title: Text(list[index].name),
          subtitle: Text("Kredisi:" + list[index].point.toString()),
          trailing: IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              cartbloc.addToCart(Cart(list[index]));
              AlertDialog alertDialog = new AlertDialog(
                title: Text("İşlem Başarılı"),
                content: Text("Ders Eklendi: ${list[index].name}"),
              );
              showDialog(context: context, builder: (_) => alertDialog);
            },
          ),
        );
      });
  }
}
