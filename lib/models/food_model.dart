class FoodItemModel{
  String ? id;
  String ? name;
  String ? ingredients;
  String ? price;
  String ? category;
  String ? image;
  bool ? selected = false;
  //int ? quantity = 0;
  FoodItemModel(this.id,this.name,this.price,this.ingredients ,this.category, this.image ,this.selected/*,this.quantity*/); //constructor

  FoodItemModel.fromJson(Map<String,dynamic>json){
    id = json['id'];
    name=json['name'];
    ingredients=json['ingredients'];
    price=json['price'];
    category=json['category'];
    image=json['image'];
   /* quantity=0;*/
    selected=false;
  }



}