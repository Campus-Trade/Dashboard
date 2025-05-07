import 'dart:async';

import 'package:flutter/material.dart';

import '../../Data/repo/repo_product_impl.dart';

class ApprovedProductsCountProvider extends ChangeNotifier {
  final RepoProductImpl repo;
  StreamSubscription? _subscription;
  int count = 0;

  ApprovedProductsCountProvider(this.repo);

  void startListening() {
    _subscription = repo.getApprovedProductsCount().listen(
      (newCount) {
        count = newCount;
        notifyListeners();
      },
      onError: (error) {
        print("Error: $error");
      },
    );
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}
