import 'package:ecommerceadmin/controllers/ordercontroller.dart';
import 'package:ecommerceadmin/utils/utils.dart';
import 'package:ecommerceadmin/views/acceptedordersscreen.dart';
import 'package:ecommerceadmin/views/allordersscreen.dart';
import 'package:ecommerceadmin/views/cancelledordersscreen.dart';
import 'package:ecommerceadmin/views/deliveredordersscreen.dart';
import 'package:ecommerceadmin/widgets/errortext.dart';
import 'package:ecommerceadmin/widgets/loader.dart';
import 'package:ecommerceadmin/widgets/order_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class OrderScreenPage extends ConsumerWidget {
  const OrderScreenPage({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
   return DefaultTabController(
    length: 4,
     child: Scaffold(
      appBar: AppBar(
        elevation: 0,
        bottom:const TabBar(tabs: [
          Text("Pending Orders",style: TextStyle(color: Colors.black,fontSize: 10,fontWeight: FontWeight.w500),),
          Text("Accepted Orders",style: TextStyle(color: Colors.black,fontSize: 10,fontWeight: FontWeight.w500),),
          Text("Delivered",style: TextStyle(color: Colors.black,fontSize: 10,fontWeight: FontWeight.w500),),
          Text("Cancelled",style: TextStyle(color: Colors.black,fontSize: 10,fontWeight: FontWeight.w500),),
        ]),
      ),
      body:const TabBarView(children: [
        AllOrdersScreen(),
        AcceptedOrdersScreen(),
        DeliveredOrdersScreen(),
        CancelledOrdersScreen()
      ],),
     ),
   );
   
  }
}