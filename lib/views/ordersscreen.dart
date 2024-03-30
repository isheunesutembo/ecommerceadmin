import 'package:ecommerceadmin/controllers/ordercontroller.dart';
import 'package:ecommerceadmin/utils/utils.dart';
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
   
    final orders=ref.watch(getOrdersProvider);
    return  orders.when(data: (data){
      return Scaffold(
      appBar: AppBar(
        title:const Center(child:  Text(" Orders",
        style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w700),)),
      ),
      body: ListView.builder(scrollDirection: Axis.vertical,shrinkWrap: true,itemCount: data.length,itemBuilder: (context,index){
             final order=data[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              Card(
                child: Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  child: Column(mainAxisAlignment: MainAxisAlignment.start,children: [
                    const SizedBox(height: 10,),
                     Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                          const Text("Order Number:",
                              style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w400),),
                           Text(order.orderId.toString(),
                              style:const TextStyle(color: Colors.black,fontSize: 10,fontWeight: FontWeight.w500,),),
                         ],
                       ),
                     ),
                        const SizedBox(height: 15,),
      
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                        const Text("Date",
                                style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w400),),
                             Text(DateFormat.yMMMMd().format(order.date),
                                style:const TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w500),),
                    ],),
                  ),
                        const SizedBox(height: 15,),
                
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                        const Text("Total:",
                                style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w400),),
                             Text("\$${order.total}",
                                style:const TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w500),),
                    ],),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                      SizedBox(
                        height: 50,
                        width: 150,
                        child:data[index].isAccepted==false  ? ElevatedButton(onPressed: ()async{
                            ref.read(orderControllerProvider.notifier)
                                .updateOrder(data[index], "isAccepted", order.isAccepted!).then((value) => showSnackBar(context,"order status changed to accepted"));
                        
                        },style: ElevatedButton.styleFrom(backgroundColor: Colors.black), child:  const Text("Accept",style: TextStyle(color: Colors.white),)):ElevatedButton(onPressed: ()async{
                            ref.read(orderControllerProvider.notifier)
                                .updateOrder(data[index], "isDelivered", data[index].isDelivered!).then((value) => showSnackBar(context,"order status changed to delivered"));
                        
                        },style: ElevatedButton.styleFrom(backgroundColor: Colors.black), child:  const Text("Delivered",style: TextStyle(color: Colors.white),)),
                      ),
                             SizedBox(
                              height: 50,
                              width: 150,
                               child: ElevatedButton(onPressed: ()async{
                                ref.read(orderControllerProvider.notifier)
                                .updateOrder(data[index], "isCanceled", data[index].isCancelled!).then((value) => showSnackBar(context,"order status changed to cancelled"));
                               
                                                   },style: ElevatedButton.styleFrom(backgroundColor: Colors.black), child:const  Text("Cancel",style: TextStyle(color: Colors.white))),
                             )
                    ],),
                  ),
                  Column(children: data[index].products.map((order) =>OrderItemWidget(item: order) ).toList())
                
                  ],)
                  ,
                ),
              ),
             // Positioned(top: 2,right: 0,child: Container(decoration: BoxDecoration(color: order.isAccepted !=false||order.isAccepted!="" "OrderStatus.pending"||order.orderStatus.toString()=="OrderStatus.processing"?Colors.yellow[700]:Colors.green,borderRadius: BorderRadius.circular(5)),
            //  child: Text(order.orderStatus.toString(),style:const TextStyle(color: Colors.white,fontSize: 15),),)),
               
            ],
          ),
        );
      
      })
    );

    }, error: (error,stackTrace)=>ErrorText(error:error.toString()), loading: ()=>Loader());
  }
}