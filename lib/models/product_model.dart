class ProductModel{
  List<dynamic> data;
  bool status;
  ProductModel({required this.data, required this.status});
  factory ProductModel.getJson(Map json){
    return ProductModel(data: json['data']['products'], status: json['status']);
  }
}