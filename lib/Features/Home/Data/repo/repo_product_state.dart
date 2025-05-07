import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../../../../Core/errors/failure.dart';
import '../Model/product_Model.dart';

class RepoProductStateImpl {
  Future<Either<Failure, Unit>> changeProductState(String productId) async {
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('products')
          .doc(productId)
          .update({'productState': 'approved'});
      return right(unit);
    } on FirebaseException catch (e) {
      return left(ServerFailure("Firestore error: ${e.message}"));
    } catch (e) {
      return left(
        ServerFailure("An unexpected error occurred: ${e.toString()}"),
      );
    }
  }

  Future<Either<Failure, Unit>> deleteProduct(String productId) async {
    try {
      final querySnapshot =
          await FirebaseFirestore.instance
              .collection('products')
              .doc(productId)
              .delete();
      return right(unit);
    } on FirebaseException catch (e) {
      return left(ServerFailure("Firestore error: ${e.message}"));
    } catch (e) {
      return left(
        ServerFailure("An unexpected error occurred: ${e.toString()}"),
      );
    }
  }
}
