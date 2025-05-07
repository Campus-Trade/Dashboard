import 'package:dashboard/Features/Home/Data/Model/User_Model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProductModel {
  final String? name;
  final String? address;
  final String? productId;
  final String? userId;
  final String? description;
  final String? price;
  final String? imageUrl;
  final String? productState;
  UserModel? user;

  ProductModel({
    required this.address,
    required this.user,
    required this.userId,
    required this.name,
    required this.productState,
    required this.productId,
    required this.description,
    required this.price,
    required this.imageUrl,
  });
  factory ProductModel.fromMap(Map<String, dynamic> Map) {
    return ProductModel(
      address: Map['address'] as String?,
      user: Map['user'] != null ? UserModel.fromMap(Map['user']) : null,
      userId: Map['userId'] as String?,
      name: Map['name'] as String?,
      productState: Map['productState'] as String?,
      productId: Map['productId'] as String?,
      description: Map['description'] as String?,
      price: Map['price'] as String?,
      imageUrl: Map['imageUrl'] as String?,
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'user': user?.toMap(),
      'userId': userId,
      'name': name,
      'productState': productState,
      'productId': productId,
      'description': description,
      'address': address,
      'price': price,

      'imageUrl': imageUrl,
    };
  }
}
