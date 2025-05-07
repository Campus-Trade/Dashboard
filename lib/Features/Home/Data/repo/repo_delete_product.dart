import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../../../../Core/errors/failure.dart';

class RepoDeleteProductImpl {
  Future<Either<Failure, bool>> DeleteProduct(String productId) async {
    try {
      final querySnapshot =
          await FirebaseFirestore.instance
              .collection('products')
              .doc(productId)
              .delete();
      return right(true);
    } on FirebaseException catch (e) {
      return left(ServerFailure("Firestore error: ${e.message}"));
    } catch (e) {
      return left(
        ServerFailure("An unexpected error occurred: ${e.toString()}"),
      );
    }
  }
}
