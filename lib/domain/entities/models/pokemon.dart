class Pokemon{
  String? name, image, description, color, text_color;

  Pokemon({
    this.name,
    this.image,
    this.description,
    this.color,
    this.text_color
  });

  factory Pokemon.fromJson(Map<String, dynamic> map){
    return Pokemon(
      name: map["name"],
      image: map["image"],
      description: map["description"],
      color: map["color"],
      text_color: map["text_color"]
    );
  }

  factory Pokemon.defaultValue()=>
      Pokemon(name: "",
      image: "",
      description: "",
      color: "",
      text_color: "");
}