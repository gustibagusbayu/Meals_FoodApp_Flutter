class PopularOrderModel {
  String name;
  String image;

  PopularOrderModel(this.name, this.image);
}

List<PopularOrderModel> populars = popularsData
    .map((item) => PopularOrderModel(item['name'], item['image']))
    .toList();

var popularsData = [
  {
    "name": "Pepperoni \nCheese Pizza",
    "image": "assets/images/pizza_img.png",
  },
  {
    "name": "Chicken \nParmesan Pasta",
    "image": "assets/images/pasta_img.png",
  },
  {
    "name": "Burger Cheese \nand French Fries",
    "image": "assets/images/burger_img.png",
  },
];
