import 'package:ecommerceadmin/controllers/paymentscontroller.dart';
import 'package:ecommerceadmin/widgets/errortext.dart';
import 'package:ecommerceadmin/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';


class PaymentsScreen extends ConsumerWidget {
  const PaymentsScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    
    final payments=ref.watch(getPaymentsStreamProvider);
    return payments.when(data: (data){
      return Scaffold(
        appBar: AppBar(elevation: 0,
        title:const Text("Payments",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w500),),),
        body: ListView.builder(shrinkWrap: true,itemCount: data.length,itemBuilder: (context,index){
          return  Card(
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Transaction Id:${data[index].transactionId}",
                style:const TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w500) ,),
                const SizedBox(height: 15,),
                Text("Date:${DateFormat.yMMMMd().format(data[index].date)}",
                style:const TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w500) ,),
                  const SizedBox(height: 15,),
                  Text("Amount:${data[index].amount}",
                style:const TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w500) ,),
                
                ],
              ),
            )
            
          );
        
        }),
      );

    }, error: (error,stackTrace)=>ErrorText(error: error.toString()), loading: ()=>const Loader());
}

}