class PopularRestaurantModel {
  String name;
  String place;
  String image;

  PopularRestaurantModel(this.name, this.place, this.image);
}

List<PopularRestaurantModel> restaurants = restaurantsData
    .map((item) =>
        PopularRestaurantModel(item['name'], item['place'], item['image']))
    .toList();

var restaurantsData = [
  {
    "name": "The Petes\'za",
    "place": "Italian Country",
    "image": "assets/images/restaurant1.png",
  },
  {
    "name": "The Rosiasta",
    "place": "New Zealand",
    "image": "assets/images/restaurant2.png",
  },
];
