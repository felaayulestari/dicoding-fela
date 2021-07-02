class Product{
  String _nameProduct, _url, _SKU, _ct, _md, _yr, _descrip;
  int _id, _price;

  int get id => _id;
  set id(int value) => this._id = value;

  String get name => this._nameProduct;
  set name(String value) => this._nameProduct = value;
  
  int get price => this._price;
  set price(int value) => this._price = value;
  
  String get url => this._url;
  set url(String value) => this._url = value;
  
  String get sku => this._SKU;
  set sku(String value) => this._SKU = value;

  String get category => this._ct;
  set category(String value) => this._ct = value;

  String get model => this._md;
  set model(String value) => this._md = value;

  String get year => this._yr;
  set year(String value) => this._yr = value;
  
  String get descrip => this._descrip;
  set descrip(String value) => this._descrip = value;
  
// konstruktor versi 1
  Product(this._url, this._nameProduct, this._price, this._SKU, this._ct, this._md, this._yr, this._descrip);
// konstruktor versi 2: konversi dari Map ke Item
  Product.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._url = map['img'];
    this._nameProduct = map['nama'];
    this._price = map['price'];
    this._SKU = map['SKU'];
    this._ct = map['category'];
    this._md = map['model'];
    this._yr = map['year'];
    this._descrip = map['detail'];
  }
  // konversi dari Item ke Map
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['id'] = this._id;
    map['img'] = url;
    map['nama'] = name;
    map['price'] = price;
    map['SKU'] = sku;
    map['category'] = category;
    map['model'] = model;
    map['year'] = year;
    map['detail'] = descrip;
    return map;
  }
}
