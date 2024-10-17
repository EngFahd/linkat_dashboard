import 'dart:developer';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:linkat_center_dashboard/core/utils/app_styles.dart';
import 'package:linkat_center_dashboard/core/utils/contant.dart';
import 'package:linkat_center_dashboard/core/widgets/item_order.dart';
import 'package:linkat_center_dashboard/models/add_order_model.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        centerTitle: true,
        title: Text(
          'Orders',
          style: TextStyles.styleCairo34(context).copyWith(color: Colors.white),
        ),
      ),
      body: HomeViewBody(),
    );
  }
}

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  bool isLoading = true;
  late List<AddOrderModel> ordersList;
  //
  CollectionReference orders = FirebaseFirestore.instance.collection('orders');
  //
  List<QueryDocumentSnapshot> data = [];

  @override
  void initState() {
    ordersList = [];
    getData();
    Future.delayed(Duration(seconds: 2));
    isLoading = false;
    setState(() {});
    super.initState();
  }

  getData() async {
    QuerySnapshot querySnapshot = await orders.get();
    data.addAll(querySnapshot.docs);
    setState(() {});
  }

  @override
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: orders.snapshots(),
      builder: (context, snapshot) {
        // Handle if there's an error
        if (snapshot.hasError) {
          return Center(
            child: Text('Something went wrong: ${snapshot.error}'),
          );
        }

        // Handle the loading state
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        // Check if there are no orders
        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return Center(
            child: Text('No orders available', style: TextStyle(fontSize: 18)),
          );
        }

        // Clear the ordersList to avoid duplication
        ordersList.clear();

        // Loop through snapshot data and add it to ordersList
        for (var i = 0; i < snapshot.data!.docs.length; i++) {
          ordersList.add(
            AddOrderModel.fromFirebase(
              snapshot.data!.docs[i],
            ),
          );
        }

        // Display the list of orders
        return ModalProgressHUD(
          inAsyncCall: isLoading,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height * .9,
                child: ListView.builder(
                  padding: EdgeInsets.only(bottom: 80),
                  itemCount: ordersList.length,
                  itemBuilder: (context, index) {
                    return ItemOrderData(
                      onTap: () {
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.warning,
                          animType: AnimType.rightSlide,
                          title: 'مسح',
                          desc: 'هل تريد فعلا مسح الطلب؟',
                          btnOkOnPress: () {
                            String docId = snapshot.data!.docs[index].id;
                            orders.doc(docId).delete().then((_) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content:
                                        Text('Order deleted successfully')),
                              );
                            }).catchError((error) {
                              log('Failed to delete order: $error');
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content: Text('Failed to delete order')),
                              );
                            });
                          },
                        )..show();
                      },
                      orderModel: ordersList[index],
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
