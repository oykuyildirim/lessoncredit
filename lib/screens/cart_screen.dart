import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lessoncredit/blocs/cart_bloc.dart';
import 'package:lessoncredit/models/cart.dart';

class CartScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Seçilen Dersler"),
        backgroundColor: Colors.red[900] ,
      ),

      body: StreamBuilder(
        stream: cartbloc.getStream,
        initialData: cartbloc.getCart(),
        builder: (context, snapshot){
          return buildCart(snapshot);
        },
      ),
    );
  }

  Widget buildCart(AsyncSnapshot snapshot) {

    return ListView.builder(
        itemCount: snapshot.data.length,
        itemBuilder: (BuildContext context, index){
          final cart = snapshot.data;
          return ListTile(
            title: Text(cart[index].lesson.name),
            subtitle: Text("Kredisi:" +cart[index].lesson.point.toString()),
            trailing: IconButton(
              icon: Icon(Icons.remove),
              onPressed: (){
                cartbloc.removeFromCart(cart[index]);
                AlertDialog alertDialog = new AlertDialog(
                  title: Text("İşlem Başarılı"),
                  content: Text("Ders Silindi"),
                );
                showDialog(context: context, builder:(_)=>alertDialog);
              },
            ),
          );
        });
  }


}