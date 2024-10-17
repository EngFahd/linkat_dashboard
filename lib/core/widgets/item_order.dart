import 'package:flutter/material.dart';
import 'package:linkat_center_dashboard/core/utils/app_styles.dart';
import 'package:linkat_center_dashboard/core/utils/contant.dart';
import 'package:linkat_center_dashboard/models/add_order_model.dart';

class ItemOrderData extends StatelessWidget {
  const ItemOrderData({
    super.key,
    required this.orderModel,
    this.onTap,
  });
  final AddOrderModel orderModel;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () {
          //
        },
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              // height: 100,
              // width: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    offset:
                        const Offset(4, 4), // Horizontal and vertical offset
                    blurRadius: 10, // Softness of the shadow
                    spreadRadius: 2, // Extent of the shadow
                  ),
                ],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "الفئة :",
                        style: TextStyles.styleCairo20(context)
                            .copyWith(color: primaryColor),
                      ),
                      SizedBox(width: 8),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          overflow: TextOverflow.ellipsis,
                          orderModel.category,
                          style: TextStyles.styleCairo20(context)
                              .copyWith(fontSize: 14),
                        ),
                      )
                    ],
                  ),
                  //
                  SizedBox(height: 10),
                  //
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "أسم العميل :",
                        style: TextStyles.styleCairo20(context)
                            .copyWith(color: primaryColor),
                      ),
                      SizedBox(width: 8),
                      Text(
                        orderModel.name,
                        style: TextStyles.styleCairo20(context),
                      )
                    ],
                  ),
                  //
                  SizedBox(height: 10),
                  //
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "رقم الجوال :",
                        style: TextStyles.styleCairo20(context)
                            .copyWith(color: primaryColor),
                      ),
                      SizedBox(width: 8),
                      Text(
                        orderModel.phone,
                        style: TextStyles.styleCairo20(context),
                      )
                    ],
                  ),
                  //
                  SizedBox(height: 10),
                  //
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "البريد الإلكتروني :",
                        style: TextStyles.styleCairo20(context)
                            .copyWith(color: primaryColor),
                      ),
                      SizedBox(width: 8),
                      Text(
                        orderModel.email,
                        style: TextStyles.styleCairo20(context),
                      )
                    ],
                  ),
                  //
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "اسم الشركة/المؤسسة :",
                        style: TextStyles.styleCairo20(context)
                            .copyWith(color: primaryColor),
                      ),
                      SizedBox(width: 8),
                      Text(
                        orderModel.campany,
                        style: TextStyles.styleCairo20(context),
                      )
                    ],
                  ),
                  //
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "المدينة :",
                        style: TextStyles.styleCairo20(context)
                            .copyWith(color: primaryColor),
                      ),
                      SizedBox(width: 8),
                      Text(
                        orderModel.town,
                        style: TextStyles.styleCairo20(context),
                      )
                    ],
                  ),
                  //
                  SizedBox(height: 8),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.green,
                    ),
                    child: Icon(
                      Icons.add,
                      size: getResponsiveFontSize(context, fontSize: 40),
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.red,
                    ),
                    child: InkWell(
                      onTap: onTap,
                      child: Icon(
                        Icons.cancel,
                        size: getResponsiveFontSize(context, fontSize: 40),
                        // color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
