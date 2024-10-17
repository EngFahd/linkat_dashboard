import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:linkat_center_dashboard/models/add_order_model.dart';

class FirebaseFireStoreServices {
  CollectionReference orders = FirebaseFirestore.instance.collection('orders');
  Future<void> addUser({required AddOrderModel order }) {
    // Call the user's CollectionReference to add a new user
    return orders
        .add({
          'name': order.name, // John Doe
          'campany': order.campany,
          'email': order.email,
          'phone': order.phone,
          'town': order.town,
          'category' : order.category
        })
        .then(
          (value) => log("User Added"),
        )
        .catchError(
          (error) => log("Failed to add user: $error"),
        );
  }
  
}
