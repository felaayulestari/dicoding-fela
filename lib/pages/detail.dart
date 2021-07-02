import 'dart:ui';
import 'package:dicoding/models/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../dbHelper.dart';

void main() => runApp(Detail());

class Detail extends StatefulWidget {
  final Product product;
  final user;
  const Detail({Key key, this.product, this.user}) : super(key: key);

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  //var untuk menampung object dari favorit
  var favorit;
  //var untuk menampung tipe sub-kepribadian berdasarkan input sementara
  var data = List(26);
  //method untuk melakukan  set state / refresh
  void stateMethod() {
    setState(() {});
  }

  //instansiasi obj dbHelper
  DbHelper dbHelper = DbHelper();

  var nama;
  var partisipan ;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: BackButton(
            color: Colors.white,
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text("Detail Product"),
          backgroundColor: Colors.pinkAccent,
        ),
        backgroundColor: Colors.blueGrey[900],
        body: SingleChildScrollView(
          //padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(20),
                    child: Image.asset(widget.product.url),
                  ),
                  Container(
                    child: Text(
                      widget.product.name,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  Container(
                    child: Text(
                      'Rp ' + widget.product.price.toString(),
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  ),
                  Divider(),
                  Container(
                    child: Text('SKU : ' + widget.product.sku,
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.white)),
                  ),
                  Container(
                    child: Text('Categori : ' + widget.product.category,
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.white)),
                  ),
                  Container(
                    child: Text('Model : ' + widget.product.model,
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.white)),
                  ),
                  Container(
                    child: Text('Tahun : ' + widget.product.year,
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.white)),
                  ),
                  Divider(),
                  Container(
                    child: Text(widget.product.descrip,
                        style: TextStyle(
                          color: Colors.white,
                        )),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
