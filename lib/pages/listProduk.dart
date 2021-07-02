import 'package:dicoding/dbHelper.dart';
import 'package:dicoding/models/product.dart';
import 'package:dicoding/pages/detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

void main() => runApp(ListProduct());

class ListProduct extends StatefulWidget {
  final nama;
  const ListProduct({Key key, this.nama}) : super(key: key);

  @override
  _ListProductState createState() => _ListProductState();
}

class _ListProductState extends State<ListProduct> {
  int count = 0;
  List<Product> productList;
  //instansiasi obj dbHelper
  DbHelper dbHelper = DbHelper();

  @override
  Widget build(BuildContext context) {
    updateListView();
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: BackButton(
            color: Colors.white,
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text("List Product"),
          backgroundColor: Colors.pink,
        ),
        body: Column(
          children: [Expanded(child: createListView())],
        ),
      ),
    );
  }

  ListView createListView() {
    //builder untuk generate card sebanyak record pada table Product
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          color: Colors.white,
          elevation: 2.0,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blueGrey[900],
              child: Image.asset(productList[index].url),
            ),
            title: Text(
              this.productList[index].name,
            ),
            subtitle: Text(this.productList[index].name.toString()),
            trailing: null,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  //menuju pages detail untuk melihat keterangan dari tipe Product yang dipilih
                  builder: (context) => Detail(product: productList[index], user: widget.nama),
                ),
              );
              
            },
          ),
        );
      },
    );
  }

  //melakukan update tampilan berdasar kondisi db saat ini
  void updateListView() {
    final Future<Database> dbFuture = dbHelper.initDb();
    dbFuture.then((database) {
      Future<List<Product>> productListFuture = dbHelper.getProductList();
      productListFuture.then((productList) {
        setState(() {
          this.productList = productList;
          this.count = productList.length;
        });
      });
    });
  }
}
