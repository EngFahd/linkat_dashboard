class AddOrderModel {
  final String name;
  final String phone;
  final String email;
  final String campany;
  final String town;
  final String category;
  // final String id;
  AddOrderModel( {

    required this.name,
    // required this.id,
    required this.phone,
    required this.email,
    required this.campany,
    required this.town,
   required this.category,
  });
  factory AddOrderModel.fromFirebase(json){
    return AddOrderModel(
      // id: json['id'],
      name: json['name'],
      phone: json['phone'],
      email: json['email'],
      campany: json['campany'],
      town: json['town'],
      category: json['category'],
    );
  }
}
