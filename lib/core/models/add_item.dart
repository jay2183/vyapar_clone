class AddItemModel{
  int itemNum;
  String? itemName;
  String? quantity;
  String? unit;
  String? price;
  String? totalPrice;
  String? tax;

  AddItemModel({this.itemName,this.quantity,this.unit,required this.price,this.tax,required this.itemNum,this.totalPrice});

}