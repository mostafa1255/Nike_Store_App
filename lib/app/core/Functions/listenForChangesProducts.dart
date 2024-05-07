import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:nike_store_app/app/core/utils/global_variable.dart';
import 'package:nike_store_app/app/data/models/Products_Model.dart';

void listenForChangesProducts() {
  FirebaseFirestore.instance
      .collection('products')
      .snapshots()
      .listen((snapshot) {
    print("===========listenForChangesProducts==========");
    var productsBox = Hive.box<ProductsModel>(GloblaVariable.kAllProducts);
    for (var change in snapshot.docChanges) {
      if (change.type == DocumentChangeType.added) {
        var productData = change.doc.data();
        var product = ProductsModel.fromJson(map: productData!);
        productsBox.put(product.id, product);
      } else if (change.type == DocumentChangeType.modified) {
        // Handle modified product
        var productData = change.doc.data();
        var modifiedProduct = ProductsModel.fromJson(map: productData!);
        var existingProduct = productsBox.get(modifiedProduct.id);
        if (existingProduct != null) {
          // Update existing product with modified data
          productsBox.put(modifiedProduct.id, modifiedProduct);
        }
      } else if (change.type == DocumentChangeType.removed) {
        productsBox.delete(change.doc.id);
      }
    }
  });
}
