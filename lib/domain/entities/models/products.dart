import 'dart:convert';

class Product{
  int? id;
  String? title, description, image;

  Product({int? id,
  String? title, String? description,
    String? image}){
    this.id=id;
    this.title=title;
    this.description=description;
    this.image=image;
  }

  factory Product.defaultValue()=>Product(id:-1,
      title: "",
      description: "",
      image: "");

  factory Product.fromJson(Map<String, dynamic> map){

    return Product(id: map["show"]["id"],
    title: map['show']["name"],
    description: map['show']['summary'],
    image: map['show']['image']['medium']);
  }

  Map<String, dynamic> toJson() => {
    'id':id,
    'title':title,
    'decription':description,
    'image':image
  };

  @override
  String toString() {
    return 'Product: ${JsonEncoder.withIndent('  ').convert(this)}';
  }
}