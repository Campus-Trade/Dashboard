import 'dart:math';
import 'package:dartz/dartz.dart';
import 'package:dashboard/Core/errors/failure.dart';
import 'package:dashboard/Features/Home/Data/Model/product_Model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import '../Model/User_Model.dart';

class RepoProductImpl {
  Future<Either<Failure, List<ProductModel>>> getPendingProducts() async {
    try {
      final querySnapshot =
          await FirebaseFirestore.instance
              .collection('products')
              .where("productState", isEqualTo: "pending")
              .get();

      if (querySnapshot.docs.isNotEmpty) {
        final products =
            querySnapshot.docs
                .map((doc) => ProductModel.fromMap(doc.data()))
                .toList();
        return right(products);
      } else {
        return left(ServerFailure("No products found!"));
      }
    } on FirebaseException catch (e) {
      return left(ServerFailure("Firestore error: ${e.message}"));
    } catch (e) {
      return left(
        ServerFailure("An unexpected error occurred: ${e.toString()}"),
      );
    }
  }

  Stream<int> getApprovedProductsCount() {
    return FirebaseFirestore.instance
        .collection('products')
        .where("productState", isEqualTo: "approved")
        .snapshots()
        .map((snapshot) => snapshot.docs.length);
    //   int approvedCount = products.length;

    //   return right(approvedCount); // ✅ حتى لو كانت 0، نرجعها كـ right
    // } on FirebaseException catch (e) {
    //   return left(ServerFailure("Firestore error: ${e.message}"));
    // } catch (e) {
    //   return left(
    //     ServerFailure("An unexpected error occurred: ${e.toString()}"),
    //   );
    // }
  }

  Future<Either<Failure, UserModel>> getUserById(String userId) async {
    try {
      final docSnapshot =
          await FirebaseFirestore.instance
              .collection('users')
              .doc(userId)
              .get();

      return docSnapshot.exists
          ? right(UserModel.fromMap(docSnapshot.data()!))
          : left(ServerFailure("المستخدم غير موجود"));
    } on FirebaseException catch (e) {
      return left(ServerFailure("خطأ في جلب بيانات المستخدم: ${e.message}"));
    } catch (e) {
      return left(ServerFailure("حدث خطأ أثناء جلب بيانات المستخدم"));
    }
  }
}
