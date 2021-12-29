class Food {

  late String thName;
  late String enName;
  late String foodvalue;
  late int price;
  
  Food(this.enName, this.thName, this.foodvalue, this.price);

    static List<Food> getFood(){
      return[
        Food('Pizza', 'พิซซ่า','pizza', 69),
        Food('Steak', 'สเต็ก','steak', 89),
        Food('Shabu', 'ชาบู', 'Shabu', 299),
        Food('Salad', 'สลัด', 'salad', 79)
      ];
    }
}